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
    @objc
    func viewDidPressCancelLast() {

    }
}
