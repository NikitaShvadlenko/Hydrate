import Foundation

final class OnboardingActivityScreenPresenter {
    weak var view: OnboardingActivityScreenViewInput?
    weak var moduleOutput: OnboardingActivityScreenModuleOutput?
    var interactor: OnboardingActivityScreenInteractorInput?
    var router: OnboardingActivityScreenRouterInput?
    var activitySelectionManager: ActivitySelectionViewManagerProtocol?
    var selectedActivity: ActivityLevel?
}

// MARK: - OnboardingActivityScreenViewOutput
extension OnboardingActivityScreenPresenter: OnboardingActivityScreenViewOutput {
    func viewDidPressNextButton(_ view: OnboardingActivityScreenViewInput) {
        guard let activity = selectedActivity else {
            fatalError("Activity was not selected, but the button pressed")
        }
        interactor?.saveActivity(activity)
    }

    func viewDidLoad(_ view: OnboardingActivityScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - OnboardingActivityScreenInteractorOutput
extension OnboardingActivityScreenPresenter: OnboardingActivityScreenInteractorOutput {
    func interactor(_ interactor: OnboardingActivityScreenInteractorInput, didSaveActivity activity: ActivityLevel) {
        print("Once next is pressed, need to open next screen")
    }
}

// MARK: - OnboardingActivityScreenRouterOutput
extension OnboardingActivityScreenPresenter: OnboardingActivityScreenRouterOutput {
}

// MARK: - OnboardingActivityScreenModuleInput
extension OnboardingActivityScreenPresenter: OnboardingActivityScreenModuleInput {
    func configureModule(output: OnboardingActivityScreenModuleOutput?) {
        self.moduleOutput = output
    }
}
// MARK: ActivitySelectionViewManagerDelegate
extension OnboardingActivityScreenPresenter: ActivitySelectionViewManagerDelegate {
    func genederSelectionViewManager(
        _ genederSelectionViewManager: ActivitySelectionViewManagerProtocol,
        didSelectItemAt indexPath: IndexPath
    ) {
        selectedActivity = genederSelectionViewManager.activityLevels[indexPath.item]
        view?.collectionViewDidSelectCell(at: indexPath)
    }
}

// MARK: - Private methods
extension OnboardingActivityScreenPresenter {
}
