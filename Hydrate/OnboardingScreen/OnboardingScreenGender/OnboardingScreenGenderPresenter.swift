import Foundation

final class OnboardingScreenGenderPresenter {
    weak var view: OnboardingScreenGenderViewInput?
    weak var moduleOutput: OnboardingScreenGenderModuleOutput?
    var interactor: OnboardingScreenGenderInteractorInput?
    var router: OnboardingScreenGenderRouterInput?
    var genderSelectionManager: GenderSelectionViewManagerProtocol?
    var selectedGender: Gender?
}

// MARK: - OnboardingScreenGenderViewOutput
extension OnboardingScreenGenderPresenter: OnboardingScreenGenderViewOutput {
    func viewDidPressNextButton(_ view: OnboardingScreenGenderViewInput) {
        guard let gender = selectedGender else {
            fatalError("Gender was not selected, but the button pressed")
        }
        interactor?.saveGender(gender)
    }

    func viewDidLoad(_ view: OnboardingScreenGenderViewInput) {
        view.configureViews()
    }
}

// MARK: - OnboardingScreenGenderInteractorOutput
extension OnboardingScreenGenderPresenter: OnboardingScreenGenderInteractorOutput {
}

// MARK: - OnboardingScreenGenderRouterOutput
extension OnboardingScreenGenderPresenter: OnboardingScreenGenderRouterOutput {
}

// MARK: - OnboardingScreenGenderModuleInput
extension OnboardingScreenGenderPresenter: OnboardingScreenGenderModuleInput {
    func configureModule(output: OnboardingScreenGenderModuleOutput?) {
        self.moduleOutput = output
    }
}
// MARK: GenderSelectionViewManagerDelegate
extension OnboardingScreenGenderPresenter: GenderSelectionViewManagerDelegate {
    func genederSelectionViewManager(
        _ genederSelectionViewManager: GenderSelectionViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedGender = genederSelectionViewManager.genders[indexPath.item]
        view?.collectionViewDidSelectCell(at: indexPath)
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderPresenter {
}
