import UIKit
import SnapKit

final class MainScreenView: UIView {
    let progressView = HydrationProgressView()
    let shortcutsView = ShortcutsView()
    let pageView = PageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        pageView.setupPages(numberOfPages: 3)
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
        addSubview(pageView)

        progressView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.height.equalTo(progressView.snp.width)
        }

        pageView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.height.equalTo(10)
        }

        shortcutsView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(shortcutsView.snp.width).multipliedBy(0.44)
            make.bottom.equalTo(pageView.snp.top)
        }
    }
}
