import UIKit
import SnapKit

protocol MainScreenViewDelegate: AnyObject {
    func viewDidPressCancelLast(_ view: MainScreenView)
}

final class MainScreenView: UIView {
    let progressView = HydrationProgressView()
    let shortcutsView = ShortcutsView()
    weak var delegate: MainScreenViewDelegate?

    private lazy var undesignedView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    private lazy var calendarView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(scrollViewContentView)
        return scrollView
    }()

    private lazy var scrollViewContentView: UIView = {
        let contentView = UIView()
        [
            undesignedView,
            progressView,
            cancelLastButton,
            shortcutsView,
            calendarView
        ].forEach(contentView.addSubview(_:))
        return contentView
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
        addSubview(scrollView)

        undesignedView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.height.equalTo(54)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }

        scrollViewContentView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(1)
            make.bottom.lessThanOrEqualToSuperview()
        }

        progressView.snp.makeConstraints { make in
            make.top.equalTo(undesignedView.snp.bottom).offset(60)
            make.width.equalTo(250)
            make.height.equalTo(progressView.snp.width)
            make.centerX.equalToSuperview()
        }

        calendarView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(900)
            
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
