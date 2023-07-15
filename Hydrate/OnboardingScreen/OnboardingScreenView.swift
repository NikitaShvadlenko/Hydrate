import UIKit

final class OnboardingScreenView: UIView {

    let pageViewContainer = UIView()
    let pageView = PageView(elementWidth: 8, spacingBetweenElements: 12)
    let navigationNextButton = NavigationNextButton()
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
// MARK: Public Methods
extension OnboardingScreenView {
   public func hideBackButton() {
        navigationBackButton.alpha = 0
    }

    public func displayBackButton() {
        navigationBackButton.alpha = 1
    }

    func displayNextButton() {
        if navigationNextButton.alpha != 1 {
            UIView.animate(withDuration: 0.2) {
                self.navigationNextButton.alpha = 1
            }
        }
    }

}
// MARK: - Private methods
extension OnboardingScreenView {
    private func configureViews() {
        addSubview(pageView)
        addSubview(navigationBackButton)
        addSubview(navigationNextButton)
        navigationNextButton.alpha = 0.5
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

        navigationNextButton.snp.makeConstraints { make in
            make.bottom.equalTo(pageView.snp.top).offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(340)
        }
    }
}
