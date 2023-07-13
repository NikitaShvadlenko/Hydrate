import Foundation

final class OnboardingScreenGenderInteractor {
    weak var presenter: OnboardingScreenGenderInteractorOutput?
}

// MARK: - OnboardingScreenGenderInteractorInput
extension OnboardingScreenGenderInteractor: OnboardingScreenGenderInteractorInput {
    func saveGender(_ gender: Gender) {
        print("saving", gender.rawValue)
        presenter?.interactor(self, didSaveGender: gender)
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderInteractor {
}
