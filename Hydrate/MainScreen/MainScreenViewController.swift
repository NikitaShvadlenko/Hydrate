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
}

// MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
    func configureViews() {
    }

    func setHydration(model: HydrationProgressModel) {
        let progress = model.amount.value / model.goal.value
        let variance = model.amount.value - model.goal.value
            mainScreenView.progressView.configureView(
            progress: progress,
            amount: model.amount,
            variance: Measurement(value: variance, unit: model.amount.unit)
        )
    }
}

// MARK: - Private methods
extension MainScreenViewController {

}
