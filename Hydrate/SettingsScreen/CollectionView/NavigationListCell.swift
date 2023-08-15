import UIKit

// TODO: when new cell types are used (switch cell, value cell...), make one protocol
final public class NavigationListCell: UICollectionViewCell {

    private let label = SubtitleLabel()
    private var onTapAction: (() -> Void)?

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

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
        contentView.addSubview(separatorView)
        label.textAlignment = .left

        separatorView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12.5)
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }

    }
}
