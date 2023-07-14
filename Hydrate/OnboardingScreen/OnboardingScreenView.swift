import UIKit

final class OnboardingScreenView: UIView {

    let pageViewContainer = UIView()
    let pageView = PageView()
    let navigationBackButton = NavigationBackButton(width: 37.55)

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
extension OnboardingScreenView {
    private func configureViews() {
        addSubview(pageView)
        addSubview(navigationBackButton)
        navigationBackButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(16)
        }

        backgroundColor = Asset.onboardingScreenBackgroundColor.color
        pageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(10)
        }
    }
}
