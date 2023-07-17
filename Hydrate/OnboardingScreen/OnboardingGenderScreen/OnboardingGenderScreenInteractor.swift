import Foundation

final class OnboardingGenderScreenInteractor {
    weak var presenter: OnboardingGenderScreenInteractorOutput?
}

// MARK: - OnboardingGenderScreenInteractorInput
extension OnboardingGenderScreenInteractor: OnboardingGenderScreenInteractorInput {
    func saveGender(_ gender: Gender) {
        print("saving", gender.rawValue)
        presenter?.interactor(self, didSaveGender: gender)
    }
}

// MARK: - Private methods
extension OnboardingGenderScreenInteractor {
}
