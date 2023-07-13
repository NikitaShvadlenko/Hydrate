import UIKit

final class OnboardingScreenGenderViewController: UIViewController {

    private let onboardingScreenGenderView = OnboardingScreenGenderView()

    var presenter: OnboardingScreenGenderViewOutput?

    override func loadView() {
        view = onboardingScreenGenderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

    func setCollectionViewDataSource(dataSource: UICollectionViewDataSource) {
        onboardingScreenGenderView.genderSelectionView.dataSource = dataSource
    }

    func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
        onboardingScreenGenderView.genderSelectionView.delegate = delegate
    }
}

// MARK: - OnboardingScreenGenderViewInput
extension OnboardingScreenGenderViewController: OnboardingScreenGenderViewInput {
    func collectionViewDidSelectCell(at indexPath: IndexPath) {
        onboardingScreenGenderView.displayNextButton()
    }

    func configureViews() {
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderViewController {
}
