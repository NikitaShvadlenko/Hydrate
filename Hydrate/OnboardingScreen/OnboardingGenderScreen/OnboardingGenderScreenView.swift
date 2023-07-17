import UIKit
import SnapKit

final class OnboardingGenderScreenView: UIView {

    let titleLabel = TitleLabel()
    let genderSelectionView = OnboardingGenderScreenCollectionView()

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
extension OnboardingGenderScreenView {

}

// MARK: - Private methods
extension OnboardingGenderScreenView {
    private func configureViews() {
        addSubview(titleLabel)
        addSubview(genderSelectionView)

        backgroundColor = Asset.onboardingScreenBackgroundColor.color
        titleLabel.text = L10n.OnboardingGenderScreen.screenTitle
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }

        genderSelectionView.snp.makeConstraints { make in
            make.height.equalTo(247)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
        }
    }
}
