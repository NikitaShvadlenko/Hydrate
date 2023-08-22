import UIKit
import SnapKit

final class MainScreenView: UIView {
    let progressView = HydrationProgressView()
    let shortcutsView = ShortcutsView()
    private lazy var undisegnedView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
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
extension MainScreenView {
    private func configureViews() {
        backgroundColor = Asset.backgroundColor.color
        addSubview(progressView)
        addSubview(undisegnedView)

        undisegnedView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.height.equalTo(54)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        progressView.snp.makeConstraints { make in
            make.top.equalTo(undisegnedView.snp.bottom)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(progressView.snp.width)
            make.centerX.equalToSuperview()
        }
    }
}
