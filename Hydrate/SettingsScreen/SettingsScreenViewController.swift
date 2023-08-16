import UIKit

final class SettingsScreenViewController: UIViewController {

    private let settingsScreenView = SettingsScreenView()

    var presenter: SettingsScreenViewOutput?

    override func loadView() {
        view = settingsScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.largeTitleDisplayMode = .never
        presenter?.viewDidLoad(self)
        refreshTableView()
    }
}

// MARK: - SettingsScreenViewInput
extension SettingsScreenViewController: SettingsScreenViewInput {
    func setTableViewManager(_ manager: SettingsTableViewManagerProtocol) {
        settingsScreenView.tableView.dataSource = manager
        settingsScreenView.tableView.delegate = manager
    }

    func configureViews() {
    }
}

// MARK: - Private methods
extension SettingsScreenViewController {
    func refreshTableView() {
        settingsScreenView.tableView.reloadData()
    }
}
