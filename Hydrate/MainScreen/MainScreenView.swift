import UIKit
import SnapKit

final class MainScreenView: UIView {
    let progressView = HydrationProgressView()
    let shortcutsView = ShortcutsView()

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
        progressView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(progressView.snp.width)
            make.centerX.equalToSuperview()
        }
    }
}
