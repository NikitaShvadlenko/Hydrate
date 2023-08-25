import UIKit
import SnapKit

final class MainScreenInfoCell: UICollectionViewCell {

    lazy var toolbar: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    let hydrationView = HydrationProgressView()

    private lazy var cancelLastButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.MainScreen.cancelButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(viewDidPressCancelLast), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension MainScreenInfoCell {
    public func configure(_ color: UIColor) {
        contentView.backgroundColor = color
    }
}

// MARK: - Private Methods
extension MainScreenInfoCell {

    private func setupView() {
        [
            toolbar,
            hydrationView,
            cancelLastButton
        ].forEach(contentView.addSubview(_:))

        toolbar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(54)
        }

        hydrationView.snp.makeConstraints { make in
            make.top.equalTo(toolbar.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(250)
        }

        cancelLastButton.snp.makeConstraints { make in
            make.top.equalTo(hydrationView.snp.bottom).offset(66)
            make.centerX.equalToSuperview()
        }
    }

    @objc
    func viewDidPressCancelLast() {

    }
}
