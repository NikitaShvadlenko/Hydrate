import UIKit

// TODO: when new cell types are used (switch cell, value cell...), make one protocol
final public class NavigationListCell: UICollectionViewCell {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Asset.primaryTextColor.color
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private var onTapAction: (() -> Void)?

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.5)
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
    public func configure(
        title: String,
        onTapAction: @escaping () -> Void,
        isFirst: Bool,
        isLast: Bool
    ) {
        self.label.text = title
        self.onTapAction = onTapAction
        if isFirst && isLast {
            contentView.roundCorners(using: [.allCorners], cornerRadii: CGSize(width: 10, height: 10))
        } else if isFirst {
            contentView.roundCorners(using: [.topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10))
        } else if isLast {
            contentView.roundCorners(using: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        }
    }

    public func cellTapped(_ cell: NavigationListCell) {
        guard let onTapAction = onTapAction else { return }
        onTapAction()
    }
}

// MARK: - Private methods
extension NavigationListCell {
    private func setupView() {
        contentView.backgroundColor = Asset.backgroundContainerColor.color
        contentView.addSubview(label)
        contentView.addSubview(separatorView)
        label.textAlignment = .left

        separatorView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
            make.leading.trailing.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }

    }
}
