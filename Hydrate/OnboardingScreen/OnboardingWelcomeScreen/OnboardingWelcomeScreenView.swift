import UIKit

final class OnboardingWelcomeScreenView: UIView {
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
extension OnboardingWelcomeScreenView {
    private func configureViews() {
        backgroundColor = .white
    }
}
