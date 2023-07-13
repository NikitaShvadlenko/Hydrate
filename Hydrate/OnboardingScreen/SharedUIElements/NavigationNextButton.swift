import UIKit

protocol NavigationNextButtonDelegate: AnyObject {
    func buttonPressed()
}

class NavigationNextButton: UIView {
    weak var delegate: NavigationNextButtonDelegate?

    public var title: String? {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = Asset.navigationButtonBackgroundColor.color
        button.titleLabel?.textColor = Asset.navigationButtonTextColor.color
        button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        button.layer.borderColor = Asset.primaryTextColor.color.cgColor
        button.layer.borderWidth = 5
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not Implemented")
    }

}

// MARK: Private methods
extension NavigationNextButton {
    private func setupView() {
        addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @objc
    private func buttonPressed() {
        delegate?.buttonPressed()
        print("Implement custom animation")
    }
}
