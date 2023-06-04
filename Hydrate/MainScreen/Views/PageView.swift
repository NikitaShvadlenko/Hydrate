import UIKit
import SnapKit

class PageView: UIView {

    private let elementWidth: CGFloat = 10
    private let spacingBetweenElements: CGFloat = 5
    private let pageViewHeight: CGFloat = 5

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = spacingBetweenElements
        stackView.alignment = .center
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension PageView {
    public func setupPages(numberOfPages: Int) {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            let requiredWidth = CGFloat(numberOfPages) * (spacingBetweenElements + elementWidth)
            make.edges.equalToSuperview()
            make.width.lessThanOrEqualTo(requiredWidth).priority(999)
        }

        for _ in 0..<numberOfPages {
            let view = UIView()
            view.backgroundColor = Asset.progressViewBaseColor.color
            stackView.addArrangedSubview(view)
            view.layer.cornerRadius = 5
            view.snp.makeConstraints { make in
                make.width.equalTo(elementWidth)
                make.height.equalToSuperview()
            }
        }
    }
}
