import UIKit

typealias ManagesSettingsTableView = UITableViewDataSource & UITableViewDelegate

protocol SettingsTableViewManagerProtocol: ManagesSettingsTableView {
    func setSettingsViewModel(with viewModel: SettingsViewModel)
}

final class SettingsTableViewViewManager: NSObject {
    var settingsViewModel: SettingsViewModel?
}

// MARK: - UITableViewDataSource
extension SettingsTableViewViewManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let settingsViewModel = settingsViewModel else { return 0 }
        return settingsViewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let settingsViewModel = settingsViewModel else { return 0 }
        return settingsViewModel.sections[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(NavigationListCell.self)", for: indexPath
        ) as? NavigationListCell,
             let settingsViewModel = settingsViewModel
        else {
            return UITableViewCell()
        }

        let title = settingsViewModel.sections[indexPath.section].cells[indexPath.row].title
        let action = settingsViewModel.sections[indexPath.section].cells[indexPath.row].action

        cell.configure(title: title, onTapAction: action)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        settingsViewModel?.sections[section].sectionTitle
    }
}

// MARK: - UITableViewDelegate
extension SettingsTableViewViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? NavigationListCell else { return }
    }
}

extension SettingsTableViewViewManager: SettingsTableViewManagerProtocol {
    func setSettingsViewModel(with viewModel: SettingsViewModel) {
        self.settingsViewModel = viewModel
    }
}
