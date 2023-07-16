import UIKit

final class OnboardingScreenWeightView: UIView {

    let titleLabel = TitleLabel()
    let weightSelectionView = WeightSelectionView()

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

// MARK: - Private methods
extension OnboardingScreenWeightView {
    private func configureViews() {
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(weightSelectionView)

        titleLabel.text = L10n.OnboardingScreen.weight
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }

        weightSelectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().inset(89.5)
            make.height.equalTo(183)
        }
    }
}
