import UIKit
import SnapKit

class SettingsHeaderView: UICollectionReusableView {
    private let label = TitleLabel()

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
