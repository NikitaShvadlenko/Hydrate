import UIKit

final class OnboardingScreenView: UIView {

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
        backgroundColor = .red
    }
}
