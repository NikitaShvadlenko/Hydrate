import Foundation

final class OnboardingScreenGenderInteractor {
    weak var presenter: OnboardingScreenGenderInteractorOutput?
}

// MARK: - OnboardingScreenGenderInteractorInput
extension OnboardingScreenGenderInteractor: OnboardingScreenGenderInteractorInput {
    func saveGender(_ gender: Gender) {
        print("saving", gender.rawValue)
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderInteractor {
}
