import UIKit

protocol NavigationNextButtonDelegate: AnyObject {
    func buttonPressed()
}

class NavigationNextButton: UIView {
    weak var delegate: NavigationNextButtonDelegate?
    public var isActive: Bool = false

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
        button.layer.cornerRadius = 10
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
        guard isActive else { return }
        delegate?.buttonPressed()
        // TODO: Implement custom press animation
        print("Implement custom animation")
    }
}
