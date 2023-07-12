import UIKit
import SnapKit

class OnboardingScreenGenderCollectionView: UIView {

    let containerView = BackgroundContainerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingScreenGenderCollectionView {
    private func setupView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}
