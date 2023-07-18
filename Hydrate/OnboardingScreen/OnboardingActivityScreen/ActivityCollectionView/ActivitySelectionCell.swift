import UIKit

class ActivitySelectionCell: UICollectionViewCell {

    public var isCellSelected: Bool = false {
        didSet {
            if isCellSelected {
                selectionBox.isSelected = true
            } else {
                prepareForReuse()
            }
        }
    }

    private var selectionBox = SelectionBox(width: 20)
    private let titleView = TitleLabel()
    private let subtitleView = SubtitleLabel()

    private lazy var activityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        selectionBox.isSelected = false
    }
}
// MARK: - Public methods
extension ActivitySelectionCell {
    public func configureCell(for activityLevel: ActivityLevel) {
        let title: String
        let subtitle: String

        switch activityLevel {
        case .light:
            title = L10n.ActivitySelection.Light.title
            subtitle = L10n.ActivitySelection.Light.decription
        case .moderate:
            title = L10n.ActivitySelection.Moderate.title
            subtitle = L10n.ActivitySelection.Moderate.decription
        case .heavy:
            title = L10n.ActivitySelection.Heavy.title
            subtitle = L10n.ActivitySelection.Heavy.decription
        }

        titleView.text = title
        subtitleView.text = subtitle
    }
}
// MARK: - Private methods
extension ActivitySelectionCell {
    private func setupView() {
        layer.cornerRadius = 10
        [
            selectionBox,
            activityImageView
        ].forEach(addSubview(_:))

        titleView.textAlignment = .left
        subtitleView.textAlignment = .left

        activityImageView.addSubview(titleView)
        activityImageView.addSubview(subtitleView)

        selectionBox.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }

        activityImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalTo(selectionBox.snp.leading).offset(-8)
        }

        titleView.snp.makeConstraints { make in
            make.bottom.equalTo(activityImageView.snp.centerY)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)

        }

        subtitleView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalTo(titleView.snp.bottom).offset(8)
        }
    }
}
