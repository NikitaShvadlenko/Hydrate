import UIKit

// TODO: when new cell types are used (switch cell, value cell...), make one protocol
final public class NavigationListCell: UICollectionViewCell {

    private let label = SubtitleLabel()
    private var onTapAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension NavigationListCell {
    public func configure(title: String, onTapAction: @escaping () -> Void) {
        self.label.text = title
        self.onTapAction = onTapAction
    }

    public func cellTapped(_ cell: NavigationListCell) {
        guard let onTapAction = onTapAction else { return }
        onTapAction()
    }
}

// MARK: - Private methods
extension NavigationListCell {
    private func setupView() {
        contentView.backgroundColor = Asset.backgroundColor.color
        contentView.addSubview(label)
        label.textAlignment = .left
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12.5)
            make.leading.equalToSuperview().inset(16)
        }
    }
}
