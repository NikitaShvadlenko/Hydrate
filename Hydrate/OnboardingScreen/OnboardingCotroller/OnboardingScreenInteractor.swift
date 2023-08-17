import CoreData

final class OnboardingScreenInteractor {
    weak var presenter: OnboardingScreenInteractorOutput?
    var context: NSManagedObjectContext?
    var healthKitManager: ManagesAppleHealth?
}

// MARK: - RegistrationScreenInteractorInput
extension OnboardingScreenInteractor: OnboardingScreenInteractorInput {
    func requestHealthKitAuthorization() {
        healthKitManager?.requestAuthorizationIfNeeded(completion: { [weak self] _, error in
            if let error = error {
                print(error)
            }
            guard let self = self else { return }
            self.presenter?.interactorDidRequestAuthorisation(self)
        })
    }

    func saveUser(with userData: UserDataForm) {
        guard let context = context else {
            fatalError("Context is not set")
        }
        print("saving the following:")
        print("""
                Gender: \(userData.gender),
                goal: \(userData.dailyGoal),
                activity level: \(userData.activityLevel),
                weightMeasurement: \(userData.weightMeasurementUnit.rawValue),
                weight: \(userData.weight),
                volumeUnit: \(userData.volumeMeasurementUnit)
              """)
        UserData.insert(into: context, form: userData)
    }
}

// MARK: - Private methods
extension OnboardingScreenInteractor {
}
