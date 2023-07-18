import UIKit
import SnapKit

final class OnboardingThemeScreenView: UIView {

    let titleLabel = TitleLabel()
    let themeSelectionView = OnboardingThemeScreenCollectionView()

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
extension OnboardingThemeScreenView {

}

// MARK: - Private methods
extension OnboardingThemeScreenView {
    private func configureViews() {
        addSubview(titleLabel)
        addSubview(themeSelectionView)

        backgroundColor = Asset.onboardingScreenBackgroundColor.color
        titleLabel.text = L10n.OnboardingScreen.themeScreenTitle
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }

        themeSelectionView.snp.makeConstraints { make in
            make.height.equalTo(247)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
        }
    }
}
