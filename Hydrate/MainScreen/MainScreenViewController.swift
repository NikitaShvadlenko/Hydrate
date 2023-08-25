import UIKit

final class MainScreenViewController: UIViewController {

    private let mainScreenView = MainScreenView()

    var presenter: MainScreenViewOutput?

    override func loadView() {
        view = mainScreenView
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

    func setShortcutsDataSource(_ dataSource: UICollectionViewDataSource) {
//        mainScreenView.shortcutsView.dataSource = dataSource
    }

    func setShortcutsDelegate(_ delegate: UICollectionViewDelegate) {
 //       mainScreenView.shortcutsView.delegate = delegate
    }

    func setMainScreenManager(_ manager: ManagesMainScreen) {
        manager.setCollectionView(mainScreenView.collectionView)
        mainScreenView.collectionView.dataSource = manager.dataSource
        mainScreenView.collectionView.collectionViewLayout = manager.generateLayout()
        manager.configureSnapshot()
    }
}

// MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
    func configureViews() {
    }

    func setHydration(model: HydrationViewModel) {
        let hydrationModel =
        HydrationProgressModel(
            goal: Measurement(
                value: Double(model.dailyGoal), unit: .milliliters),
            amount: Measurement(value: Double(model.totalConsumed), unit: .milliliters)
        )

// TODO: Create ViewModel
        let progress = hydrationModel.amount.value / hydrationModel.goal.value
        let variance = hydrationModel.amount.value - hydrationModel.goal.value
     //       mainScreenView.progressView.configureView(
//            progress: progress,
//            amount: hydrationModel.amount,
//            variance: Measurement(value: variance, unit: hydrationModel.amount.unit)
//        )
    }

    func reloadShortcutsCollection() {
     // mainScreenView.shortcutsView.reloadCollection()
    }
}

// MARK: - Private methods
extension MainScreenViewController {

}
