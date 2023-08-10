import UIKit

final class ActivitySelectionCell: SelectionCollectionViewCell {
    private let titleView = TitleLabel()
    private let subtitleView = SubtitleLabel()

    private lazy var activityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellView(mainContentView: activityImageView, cellStyle: .vertical, cornerRadius: 10)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
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
        activityImageView.addSubview(titleView)
        activityImageView.addSubview(subtitleView)

        titleView.textAlignment = .left
        subtitleView.textAlignment = .left

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
