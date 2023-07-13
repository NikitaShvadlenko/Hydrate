import UIKit
import SnapKit

final class OnboardingScreenGenderView: UIView {

    let titleLabel = OnboardingTitleLabel()
    let genderSelectionView = OnboardingScreenGenderCollectionView()
    let buttonContainerView = UIView()
    let nextButton = NavigationNextButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderView {
    private func configureViews() {
        nextButton.title = "NEXT"
        addSubview(titleLabel)
        addSubview(genderSelectionView)
        addSubview(buttonContainerView)
        buttonContainerView.addSubview(nextButton)

        backgroundColor = Asset.onboardingScreenBackgroundColor.color
        titleLabel.text = L10n.OnboardingScreenGender.screenTitle
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(20)
        }

        genderSelectionView.snp.makeConstraints { make in
            make.height.equalTo(247)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(35)
        }

        buttonContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(genderSelectionView.snp.bottom)
            make.bottom.equalToSuperview()
        }

        nextButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(75)
            make.width.equalTo(150)
        }
    }
}
