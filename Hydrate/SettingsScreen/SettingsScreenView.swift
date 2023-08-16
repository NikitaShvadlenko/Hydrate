import UIKit
import SnapKit

final class SettingsScreenView: UIView {
    public lazy var tableView: UITableView = {
        let tableVeiw = UITableView(frame: .zero, style: .insetGrouped)
        tableVeiw.separatorStyle = .singleLine
        tableVeiw.backgroundColor = .systemGroupedBackground
        tableVeiw.rowHeight = 44
        tableVeiw.register(NavigationListCell.self, forCellReuseIdentifier: "\(NavigationListCell.self)")
        return tableVeiw
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension SettingsScreenView {
    private func configureViews() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
