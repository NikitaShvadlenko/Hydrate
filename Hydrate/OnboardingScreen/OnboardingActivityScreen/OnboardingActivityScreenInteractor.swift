import Foundation

final class OnboardingActivityScreenInteractor {
    weak var presenter: OnboardingActivityScreenInteractorOutput?
}

// MARK: - OnboardingActivityScreenInteractorInput
extension OnboardingActivityScreenInteractor: OnboardingActivityScreenInteractorInput {
    func saveActivity(_ activity: ActivityLevel) {
        print("saving", activity.rawValue)
        presenter?.interactor(self, didSaveActivity: activity)
    }
}

// MARK: - Private methods
extension OnboardingActivityScreenInteractor {
}
