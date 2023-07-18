import UIKit
import SnapKit

final class OnboardingActivityScreenView: UIView {

    let titleLabel = TitleLabel()
    let activitySelectionView = OnboardingActivityScreenCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public methods
extension OnboardingActivityScreenView {

}

// MARK: - Private methods
extension OnboardingActivityScreenView {
    private func configureViews() {
        addSubview(titleLabel)
        addSubview(activitySelectionView)

        backgroundColor = Asset.onboardingScreenBackgroundColor.color
        titleLabel.text = L10n.OnboardingScreen.activitySelectionTitle
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }

        activitySelectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.bottom.equalToSuperview().inset(39)
            make.top.equalTo(titleLabel).inset(48)
        }
    }
}
