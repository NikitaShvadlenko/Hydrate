import UIKit
protocol NavigationBackButtonDelegate: AnyObject {
    func viewDidPressBackNavigationButton()
}

class NavigationBackButton: UIButton {
    weak var delegate: NavigationBackButtonDelegate?

    let width: CGFloat

    init(width: CGFloat) {
        self.width = width
        super.init(frame: .zero)
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

        setImage(UIImage(sfSymbol: SFSymbol.backSymbol), for: .normal)
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(width)
        }
        layer.cornerRadius = width / 2
    }

    @objc
    func buttonPressed() {
        //TODO: custom press animation
        delegate?.viewDidPressBackNavigationButton()
    }
}
