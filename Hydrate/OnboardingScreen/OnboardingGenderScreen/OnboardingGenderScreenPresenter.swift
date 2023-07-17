import Foundation

final class OnboardingGenderScreenPresenter {
    weak var view: OnboardingGenderScreenViewInput?
    weak var moduleOutput: OnboardingGenderScreenModuleOutput?
    var interactor: OnboardingGenderScreenInteractorInput?
    var router: OnboardingGenderScreenRouterInput?
    var genderSelectionManager: GenderSelectionViewManagerProtocol?
    var selectedGender: Gender?
}

// MARK: - OnboardingGenderScreenViewOutput
extension OnboardingGenderScreenPresenter: OnboardingGenderScreenViewOutput {
    func viewDidPressNextButton(_ view: OnboardingGenderScreenViewInput) {
        guard let gender = selectedGender else {
            fatalError("Gender was not selected, but the button pressed")
        }
        interactor?.saveGender(gender)
    }

    func viewDidLoad(_ view: OnboardingGenderScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - OnboardingGenderScreenInteractorOutput
extension OnboardingGenderScreenPresenter: OnboardingGenderScreenInteractorOutput {
    func interactor(_ interactor: OnboardingGenderScreenInteractorInput, didSaveGender gender: Gender) {
        print("Once next is pressed, need to open next screen")
    }
}

// MARK: - OnboardingGenderScreenRouterOutput
extension OnboardingGenderScreenPresenter: OnboardingGenderScreenRouterOutput {
}

// MARK: - OnboardingGenderScreenModuleInput
extension OnboardingGenderScreenPresenter: OnboardingGenderScreenModuleInput {
    func configureModule(output: OnboardingGenderScreenModuleOutput?) {
        self.moduleOutput = output
    }
}
// MARK: GenderSelectionViewManagerDelegate
extension OnboardingGenderScreenPresenter: GenderSelectionViewManagerDelegate {
    func genederSelectionViewManager(
        _ genederSelectionViewManager: GenderSelectionViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedGender = genederSelectionViewManager.genders[indexPath.item]
        view?.collectionViewDidSelectCell(at: indexPath)
    }
}

// MARK: - Private methods
extension OnboardingGenderScreenPresenter {
}
