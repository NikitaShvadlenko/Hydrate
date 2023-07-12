import UIKit

class BackgroundContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

extension BackgroundContainerView {
    private func setupView() {
        layer.cornerRadius = 10
        backgroundColor = Asset.backgroundContainerColor.color
    }
}
