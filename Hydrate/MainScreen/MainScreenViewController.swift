import UIKit

final class MainScreenViewController: UIViewController {

    private let mainScreenView = MainScreenView()

    var presenter: MainScreenViewOutput?

    override func loadView() {
        view = mainScreenView
        navigationController?.navigationBar.prefersLargeTitles = true
        title = L10n.currentHydration
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

    func setShortcutsDataSource(_ dataSource: UICollectionViewDataSource) {
        mainScreenView.shortcutsView.dataSource = dataSource
    }

    func setShortcutsDelegate(_ delegate: UICollectionViewDelegate) {
        mainScreenView.shortcutsView.delegate = delegate
    }
}

// MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
    func setNumberOfShortcutPages(_ numberOfPages: Int) {
        mainScreenView.pageView.setupNumberOfPages(numberOfPages)
    }

    func selectShortcutPage(_ page: Int) {
        mainScreenView.pageView.pageSelected(pageIndex: page)
    }

    func configureViews() {
    }

    func setHydration(model: ConsumptionModel) {
        let hydrationModel =
        HydrationProgressModel(
            goal: Measurement(
                value: model.dailyGoal, unit: .milliliters),
            amount: Measurement(value: model.totalConsumed, unit: .milliliters)
        )

// TODO: Create ViewModel
        let progress = hydrationModel.amount.value / hydrationModel.goal.value
        let variance = hydrationModel.amount.value - hydrationModel.goal.value
            mainScreenView.progressView.configureView(
            progress: progress,
            amount: hydrationModel.amount,
            variance: Measurement(value: variance, unit: hydrationModel.amount.unit)
        )
    }

    func reloadShortcutsCollection() {
        mainScreenView.shortcutsView.reloadCollection()
    }
}

// MARK: - Private methods
extension MainScreenViewController {

}
