import UIKit
import SnapKit

final class SettingsHeaderView: UICollectionReusableView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Asset.primaryTextColor.color
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: - Public Methods
extension SettingsHeaderView {
    public func configureView(title: String) {
        label.text = title
    }
}

// MARK: - Private Methods
extension SettingsHeaderView {
    func setupView() {
        addSubview(label)
        label.textAlignment = .left
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
    }
}
