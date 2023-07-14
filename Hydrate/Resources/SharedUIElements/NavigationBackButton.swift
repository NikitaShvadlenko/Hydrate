import UIKit
protocol NavigationBackButtonDelegate: AnyObject {
    func viewDidPressBackNavigationButton()
}

class NavigationBackButton: UIButton {
    weak var delegate: NavigationBackButtonDelegate?

    init(delegate: NavigationBackButtonDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

}

extension NavigationBackButton {
    private func setupView() {
        backgroundColor = Asset.navigationBackButtonBackgroundColor.color
        tintColor = Asset.navigationBackButtonSymbolColor.color
        imageView?.image = UIImage(sfSymbol: SFSymbol.achievements)
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc
    func buttonPressed() {
        delegate?.viewDidPressBackNavigationButton()
    }
}
