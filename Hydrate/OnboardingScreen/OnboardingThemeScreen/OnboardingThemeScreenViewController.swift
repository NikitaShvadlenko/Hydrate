import UIKit

final class OnboardingThemeScreenViewController: UIViewController {

    weak var delegate: OnboardingController?

    private let onboardingScreenThemeView = OnboardingThemeScreenView()

    var presenter: OnboardingThemeScreenViewOutput?

    override func loadView() {
        view = onboardingScreenThemeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setOnboardingDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        onboardingScreenThemeView.themeSelectionView.reloadCollection()
    }

    func setCollectionViewDataSource(dataSource: UICollectionViewDataSource) {
        onboardingScreenThemeView.themeSelectionView.dataSource = dataSource
    }

    func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
        onboardingScreenThemeView.themeSelectionView.delegate = delegate
    }
}

// MARK: - OnboardingThemeScreenViewInput
extension OnboardingThemeScreenViewController: OnboardingThemeScreenViewInput {
    func collectionViewDidSelectCell(at indexPath: IndexPath) {
        delegate?.viewDidSelectOption()
    }

    func configureViews() {
    }
}

// MARK: - NavigationNextButtonDelegate
extension OnboardingThemeScreenViewController: NavigationNextButtonDelegate {
    func buttonPressed() {
        presenter?.viewDidPressNextButton(self)
    }
}

// MARK: - Private methods
extension OnboardingThemeScreenViewController {
}

extension OnboardingThemeScreenViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.next
    }

    func viewDidPressNextButton() {
        presenter?.viewDidPressNextButton(self)
    }
}
