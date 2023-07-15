import UIKit
import SnapKit

final class OnboardingScreenGenderView: UIView {

    let titleLabel = TitleLabel()
    let genderSelectionView = OnboardingScreenGenderCollectionView()

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
extension OnboardingScreenGenderView {

}

// MARK: - Private methods
extension OnboardingScreenGenderView {
    private func configureViews() {
        addSubview(titleLabel)
        addSubview(genderSelectionView)

        backgroundColor = Asset.onboardingScreenBackgroundColor.color
        titleLabel.text = L10n.OnboardingScreenGender.screenTitle
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
