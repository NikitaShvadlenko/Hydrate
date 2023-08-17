import HealthKit

protocol ManagesAppleHealth {
    func requestHealthDataAccessIfNeeded(completion: @escaping (_ success: Bool) -> Void)
    func recordWaterIntake(_ milliliters: Int, completion: @escaping (_ success: Bool) -> Void)
    func recordCaffeineIntake(_ milligrams: Int, completion: @escaping (_ success: Bool) -> Void)

}

public final class HealthKitManager {
    private let store = HKHealthStore()

    private var hkTypesToWrite: Set<HKSampleType> = [
        HKQuantityType(.dietaryWater),
        HKQuantityType(.dietaryCaffeine)
    ]

    init?() {
        guard HKHealthStore.isHealthDataAvailable() else {
            return nil
        }
    }

}

// MARK: - ManagesAppleHealth
extension HealthKitManager: ManagesAppleHealth {
    func recordCaffeineIntake(_ milligrams: Int, completion: @escaping (Bool) -> Void) {
        let sample = HKQuantitySample(
            type: HKQuantityType(.dietaryCaffeine),
            quantity: HKQuantity(unit: .gramUnit(with: .milli), doubleValue: Double(milligrams)),
            start: Date(),
            end: Date()
        )
        store.save(sample) {success, error in
            if let error = error {
                print("Failed to save sample \(error)")
            }
            completion(success)
        }
    }

    func recordWaterIntake(_ milliliters: Int, completion: @escaping (_ success: Bool) -> Void) {
        let sample = HKQuantitySample(
            type: HKQuantityType(.dietaryWater),
            quantity: HKQuantity(unit: .literUnit(with: .milli), doubleValue: Double(milliliters)),
            start: Date(),
            end: Date()
        )
        store.save(sample) {success, error in
            if let error = error {
                print("Failed to save sample \(error)")
            }
            completion(success)
        }
    }

     public func requestHealthDataAccessIfNeeded(completion: @escaping (_ success: Bool) -> Void) {
        store.requestAuthorization(toShare: hkTypesToWrite, read: nil) { (success, error) in
            if let error = error {
                print("requestAuthorization error:", error.localizedDescription)
            }
            completion(success)
        }
    }
}
