import UIKit
import SnapKit

protocol MainScreenViewDelegate: AnyObject {
    func viewDidPressCancelLast(_ view: MainScreenView)
}

final class MainScreenView: UIView {
    let progressView = HydrationProgressView()
    let shortcutsView = ShortcutsView()
    weak var delegate: MainScreenViewDelegate?

    private lazy var undisegnedView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    private lazy var cancelLastButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.MainScreen.cancelButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(viewDidPressCancelLast), for: .touchUpInside)
        return button
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
        addSubview(cancelLastButton)

        undisegnedView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.height.equalTo(54)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        progressView.snp.makeConstraints { make in
            make.top.equalTo(undisegnedView.snp.bottom).offset(66)
            make.width.equalTo(250)
            make.height.equalTo(progressView.snp.width)
            make.centerX.equalToSuperview()
        }

        cancelLastButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom).offset(66)
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - Private Methods
extension MainScreenView {
    @objc
    func viewDidPressCancelLast() {
        delegate?.viewDidPressCancelLast(self)
    }
}
