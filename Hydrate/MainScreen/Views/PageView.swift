import UIKit
import SnapKit

class PageView: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = Constants.spacingBetweenElements
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
        subviews.forEach { $0.removeFromSuperview() }
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            let requiredWidth = CGFloat(numberOfPages) * (Constants.spacingBetweenElements + Constants.elementWidth)
            make.edges.equalToSuperview()
            make.width.lessThanOrEqualTo(requiredWidth).priority(999)
        }

        for _ in 0..<numberOfPages {
            let view = UIView()
            view.backgroundColor = Asset.progressViewBaseColor.color
            stackView.addArrangedSubview(view)
            view.layer.cornerRadius = 5
            view.snp.makeConstraints { make in
                make.width.equalTo(Constants.elementWidth)
                make.height.equalToSuperview()
            }
        }
    }

    public func pageSelected(pageIndex: Int) {
        guard stackView.arrangedSubviews.count > pageIndex else {
            fatalError("Page number is higher")
        }
        stackView.arrangedSubviews[pageIndex].backgroundColor = Asset.progressViewProgressColor.color
    }
}

extension PageView {
    public enum Constants {
        static let elementWidth: CGFloat = 10
        static let spacingBetweenElements: CGFloat = 5
        static let pageViewHeight: CGFloat = 5
    }
}
