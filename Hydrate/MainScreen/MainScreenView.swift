import UIKit
import SnapKit

final class MainScreenView: UIView {
    let progressView = HydrationProgressView()

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
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
    }
}
