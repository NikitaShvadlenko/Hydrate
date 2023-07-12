import UIKit
import SnapKit

final class OnboardingScreenGenderView: UIView {

    let titleLabel = OnboardingTitleLabel()

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
        addSubview(titleLabel)
        backgroundColor = Asset.onboardingScreenBackgroundColor.color
        titleLabel.text = L10n.OnboardingScreenGender.screenTitle
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(20)
        }
    }
}
