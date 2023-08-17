import HealthKit

final class HealthKitManager: ManagesAppleHealth {

    enum HealthKitManagerError: Error {
        case noItemsToRequestPermissionToWrite
        case sharingDenied
        case undeterminedAuthorizationStatus
        case failedToSaveSample
    }

    private let store: HKHealthStore
    private let hkTypesToWrite: Set<HKSampleType> = [
        HKQuantityType(.dietaryWater),
        HKQuantityType(.dietaryCaffeine)
    ]

    init?(healthStore: HKHealthStore = HKHealthStore()) {
        guard HKHealthStore.isHealthDataAvailable() else {
            return nil
        }
        self.store = healthStore
    }
}

// MARK: - Manages Apple Health
extension HealthKitManager {

    public func recordCaffeineIntake(_ milligrams: Int, completion: @escaping CompletionHandler) {
        let caffeineType = HKQuantityType(.dietaryCaffeine)
        let unit = HKUnit.gramUnit(with: .milli)
        createAndSaveSample(type: caffeineType, unit: unit, quantityValue: Double(milligrams), completion: completion)
    }

    public func recordWaterIntake(_ milliliters: Int, completion: @escaping CompletionHandler) {
        let waterType = HKQuantityType(.dietaryWater)
        let unit = HKUnit.literUnit(with: .milli)
        createAndSaveSample(type: waterType, unit: unit, quantityValue: Double(milliliters), completion: completion)
    }
}

// MARK: - Private Methods
extension HealthKitManager {
    private func requestAuthorizationIfNeeded(completion: @escaping CompletionHandler) {
        guard let authorizationType = hkTypesToWrite.first else {
            completion(false, HealthKitManagerError.noItemsToRequestPermissionToWrite)
            return
        }

        let authorizationStatus = store.authorizationStatus(for: authorizationType)

        switch authorizationStatus {
        case .sharingAuthorized:
            completion(true, nil)

        case .sharingDenied:
            completion(false, HealthKitManagerError.sharingDenied)

        case .notDetermined:
            store.requestAuthorization(toShare: hkTypesToWrite, read: nil) { result, error in
                completion(result, error)
            }

        default:
            completion(false, HealthKitManagerError.undeterminedAuthorizationStatus)
        }
    }

    private func createAndSaveSample(
        type: HKQuantityType,
        unit: HKUnit,
        quantityValue: Double,
        completion: @escaping CompletionHandler
    ) {
        requestAuthorizationIfNeeded { [weak self] success, error in
            guard success else {
                completion(false, error)
                return
            }

            let sample = HKQuantitySample(
                type: type,
                quantity: HKQuantity(unit: unit, doubleValue: quantityValue),
                start: Date(),
                end: Date()
            )
            self?.store.save(sample) { success, error in
                if let error = error {
                    print("Failed to save sample \(error)")
                }
                completion(success, HealthKitManagerError.failedToSaveSample)
            }
        }
    }
}
