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

// MARK: - Public methods
extension OnboardingScreenGenderView {
    func displayNextButton() {
        if nextButton.alpha != 1 {
            UIView.animate(withDuration: 0.2) {
                self.nextButton.alpha = 1
            }
        }
    }
}

// MARK: - Private methods
extension OnboardingScreenGenderView {
    private func configureViews() {
        nextButton.title = L10n.OnboardingScreen.next
        nextButton.alpha = 0
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
