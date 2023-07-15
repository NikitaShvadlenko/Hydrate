import UIKit
import SnapKit

class PageView: UIView {

     var elementWidth: CGFloat
     var spacingBetweenElements: CGFloat

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = spacingBetweenElements
        stackView.alignment = .center
        return stackView
    }()

    init(elementWidth: CGFloat, spacingBetweenElements: CGFloat) {
        self.elementWidth = elementWidth
        self.spacingBetweenElements = spacingBetweenElements
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension PageView {
    public func setupNumberOfPages(_ numberOfPages: Int) {
        subviews.forEach { $0.removeFromSuperview() }
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
            view.layer.cornerRadius = elementWidth / 2
            view.snp.makeConstraints { make in
                make.width.equalTo(elementWidth)
                make.height.equalTo(elementWidth)
            }
        }
        pageSelected(pageIndex: 0)
    }

    public func pageSelected(pageIndex: Int) {
        guard stackView.arrangedSubviews.count > pageIndex else {
            fatalError("Page number is higher")
        }
        let subviews = stackView.arrangedSubviews
        subviews.forEach { $0.backgroundColor = Asset.progressViewBaseColor.color }
        subviews[pageIndex].backgroundColor = Asset.progressViewProgressColor.color
    }
}
