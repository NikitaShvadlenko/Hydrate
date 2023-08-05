import UIKit

final class OnboardingActivityScreenViewController: UIViewController {

    weak var delegate: OnboardingController?

    private let onboardingScreenActivityView = OnboardingActivityScreenView()

    var presenter: OnboardingActivityScreenViewOutput?

    override func loadView() {
        view = onboardingScreenActivityView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setOnboardingDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        onboardingScreenActivityView.activitySelectionView.reloadCollection()
    }

    func setCollectionViewDataSource(dataSource: UICollectionViewDataSource) {
        onboardingScreenActivityView.activitySelectionView.dataSource = dataSource
    }

    func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
        onboardingScreenActivityView.activitySelectionView.delegate = delegate
    }
}

// MARK: - OnboardingActivityScreenViewInput
extension OnboardingActivityScreenViewController: OnboardingActivityScreenViewInput {
    func setActivityLevel(activityLevel: ActivityLevel) {
        delegate?.childDidChooseActivityLevel(self, activityLevel: activityLevel)
    }

    func collectionViewDidSelectCell(at indexPath: IndexPath) {
        delegate?.viewDidSelectOption()
    }

    func configureViews() {
    }
}

// MARK: - NavigationNextButtonDelegate
extension OnboardingActivityScreenViewController: NavigationNextButtonDelegate {
    func buttonPressed() {
        presenter?.viewDidPressNextButton(self)
    }
}

// MARK: - Private methods
extension OnboardingActivityScreenViewController {
}

extension OnboardingActivityScreenViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.next
    }

    func viewDidPressNextButton() {
        presenter?.viewDidPressNextButton(self)
    }
}
