import UIKit

final class MainScreenViewController: UIViewController {

    private let mainScreenView = MainScreenView()

    var presenter: MainScreenViewOutput?

    override func loadView() {
        view = mainScreenView
        navigationItem.hidesBackButton = true
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
        mainScreenView.pageView.setNumberOfPages(numberOfPages)
    }

    func selectShortcutPage(_ page: Int) {
        mainScreenView.pageView.selectPage(pageIndex: page)
    }

    func configureViews() {
    }

    func setHydration(model: ConsumptionModel) {
        let hydrationModel =
        HydrationProgressModel(
            goal: Measurement(
                value: Double(model.dailyGoal), unit: .milliliters),
            amount: Measurement(value: Double(model.totalConsumed), unit: .milliliters)
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
