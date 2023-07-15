import UIKit

final class OnboardingScreenGenderViewController: UIViewController {

    weak var delegate: OnboardingController?

    private let onboardingScreenGenderView = OnboardingScreenGenderView()

    var presenter: OnboardingScreenGenderViewOutput?

    override func loadView() {
        view = onboardingScreenGenderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setOnboardingDelegate()
    }

    func setCollectionViewDataSource(dataSource: UICollectionViewDataSource) {
        onboardingScreenGenderView.genderSelectionView.dataSource = dataSource
    }

    func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
        onboardingScreenGenderView.genderSelectionView.delegate = delegate
    }

    func setOnboardingDelegate() {
        guard let parent = self.parent as? OnboardingController else {
            fatalError("No parent")
        }
        self.delegate = parent
    }

}

// MARK: - OnboardingScreenGenderViewInput
extension OnboardingScreenGenderViewController: OnboardingScreenGenderViewInput {
    func collectionViewDidSelectCell(at indexPath: IndexPath) {
        delegate?.viewDidSelectOption()
    }

    func configureViews() {
    }
}

// MARK: - NavigationNextButtonDelegate
extension OnboardingScreenGenderViewController: NavigationNextButtonDelegate {
    func buttonPressed() {
        presenter?.viewDidPressNextButton(self)
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderViewController {
}

extension OnboardingScreenGenderViewController: OnboardingChildController {
    var navigationButtonTitle: String {
        L10n.OnboardingScreen.next
    }

    func viewDidPressNextButton() {
        presenter?.viewDidPressNextButton(self)
    }
}
