import UIKit

final class OnboardingWelcomeScreenView: UIView {

    private lazy var titleLabel = TitleLabel()
    private lazy var subtitleLabel = SubtitleLabel()
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(sfSymbol: SFSymbol.plusCircle)
        return view
    }()

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
        backgroundColor = .clear
        titleLabel.text = L10n.OnboardingScreen.welcome
        subtitleLabel.text = L10n.OnboardingScreen.letsStart

        [titleLabel,
        subtitleLabel,
        imageView
        ].forEach(addSubview(_:))

        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview()
        }

        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
            make.height.equalTo(288)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
