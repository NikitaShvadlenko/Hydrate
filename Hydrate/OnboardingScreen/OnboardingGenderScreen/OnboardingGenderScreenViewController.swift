import UIKit

final class OnboardingGenderScreenViewController: UIViewController {

    weak var delegate: OnboardingController?

    private let onboardingScreenGenderView = OnboardingGenderScreenView()

    var presenter: OnboardingGenderScreenViewOutput?

    override func loadView() {
        view = onboardingScreenGenderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setOnboardingDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        onboardingScreenGenderView.genderSelectionView.reloadCollection()
    }

    func setCollectionViewDataSource(dataSource: UICollectionViewDataSource) {
        onboardingScreenGenderView.genderSelectionView.dataSource = dataSource
    }

    func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
        onboardingScreenGenderView.genderSelectionView.delegate = delegate
    }
}

// MARK: - OnboardingGenderScreenViewInput
extension OnboardingGenderScreenViewController: OnboardingGenderScreenViewInput {
    func setGender(_ gender: Gender) {
        delegate?.childDidChooseGender(self, gender: gender)
    }

    func collectionViewDidSelectCell(at indexPath: IndexPath) {
        delegate?.viewDidSelectOption()
    }

    func configureViews() {
    }
}

// MARK: - NavigationNextButtonDelegate
extension OnboardingGenderScreenViewController: NavigationNextButtonDelegate {
    func buttonPressed() {
        presenter?.viewDidPressNextButton(self)
    }
}

// MARK: - Private methods
extension OnboardingGenderScreenViewController {
}

extension OnboardingGenderScreenViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.next
    }

    func viewDidPressNextButton() {
        presenter?.viewDidPressNextButton(self)
    }
}
