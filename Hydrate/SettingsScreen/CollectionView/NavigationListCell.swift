import UIKit

// TODO: when new cell types are used (switch cell, value cell...), make one protocol
final public class NavigationListCell: UITableViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = Asset.primaryTextColor.color
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private lazy var accessoryImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(sfSymbol: SFSymbol.forwardSymbol)
        imageView.image = image
        imageView.tintColor = Asset.primaryTextColor.color
        imageView.contentMode = .center
        return imageView
    }()

    private var onTapAction: (() -> Void)?

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        var color = contentView.backgroundColor
        color = selected ? UIColor.lightGray : Asset.backgroundColor.color
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.contentView.backgroundColor = color
        }
    }
}

// MARK: - Public Methods
extension NavigationListCell {
    public func configure(
        title: String,
        onTapAction: @escaping () -> Void
    ) {
        self.label.text = title
        self.onTapAction = onTapAction
    }

    public func cellTapped() {
        guard let onTapAction = onTapAction else { return }
        onTapAction()
    }
}

// MARK: - Private methods
extension NavigationListCell {
    private func setupView() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(label)
        contentView.addSubview(accessoryImageView)
        label.textAlignment = .left

        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(accessoryImageView.snp.leading)
        }

        accessoryImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalTo(accessoryImageView.snp.height)
        }
    }
}
