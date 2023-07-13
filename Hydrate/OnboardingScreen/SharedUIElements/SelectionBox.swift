import UIKit
import SnapKit

class SelectionBox: UIView {

    var isSelected: Bool = false {
        didSet {
            if isSelected {
                backgroundColor = .brown
            } else {
                backgroundColor = .red
            }
        }
    }

    init(width: CGFloat) {
        super.init(frame: .zero)
        setupView(width: width)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectionBox {
    private func setupView(width: CGFloat) {
        backgroundColor = .red
        snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(width)
        }
        layer.cornerRadius = width/2
    }
}
