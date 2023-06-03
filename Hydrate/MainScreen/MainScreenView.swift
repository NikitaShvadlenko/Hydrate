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
        addSubview(shortcutsView)
        progressView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }

        shortcutsView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
