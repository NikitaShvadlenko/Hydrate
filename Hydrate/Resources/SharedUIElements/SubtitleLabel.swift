import UIKit

class SubtitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SubtitleLabel {
    private func setupView() {
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 16)
        textColor = Asset.secondaryTextColor.color
    }
}
