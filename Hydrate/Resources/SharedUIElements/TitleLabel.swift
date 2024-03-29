import UIKit

class TitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleLabel {
    private func setupView() {
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 20)
        textColor = Asset.primaryTextColor.color
    }
}
