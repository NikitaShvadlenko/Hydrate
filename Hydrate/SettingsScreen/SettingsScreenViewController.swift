import UIKit

final class SettingsScreenViewController: UIViewController {

    private let settingsScreenView = SettingsScreenView()

    var presenter: SettingsScreenViewOutput?

    override func loadView() {
        view = settingsScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - SettingsScreenViewInput
extension SettingsScreenViewController: SettingsScreenViewInput {
    func configureSettingsCollectionViewManager(_ manager: SettingsCollectionViewManagerProtocol) {
        manager.setCollectionView(settingsScreenView.collectionView)
        settingsScreenView.collectionView.dataSource = manager.dataSource
        settingsScreenView.collectionView.collectionViewLayout = manager.createLayout()
    }

    func configureViews() {
    }
}

// MARK: - Private methods
extension SettingsScreenViewController {
}
