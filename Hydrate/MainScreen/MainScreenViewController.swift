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
        mainScreenView.progressView.configureView(
            percentage: model.percentage,
            amount: model.amount,
            variance: model.variance
        )
    }
}

// MARK: - Private methods
extension MainScreenViewController {

}
