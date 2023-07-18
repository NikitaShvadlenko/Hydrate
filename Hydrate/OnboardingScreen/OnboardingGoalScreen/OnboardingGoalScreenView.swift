import UIKit

final class OnboardingGoalScreenView: UIView {

    let titleLabel = TitleLabel()
    let subtitleLabel = SubtitleLabel()
    let goalSelectionView = GoalSelectionView()

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
extension OnboardingGoalScreenView {
    public func updateGoal(goal: Double) {
        goalSelectionView.updateTitle(title: String(goal))
    }
}
// MARK: - Private methods
extension OnboardingGoalScreenView {
    private func configureViews() {
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(goalSelectionView)

        titleLabel.text = L10n.OnboardingScreen.intakeGoal
        subtitleLabel.text = L10n.OnboardingScreen.calculatedGoal

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }

        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        goalSelectionView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().inset(89.5)
            make.height.equalTo(183)
        }
    }
}
