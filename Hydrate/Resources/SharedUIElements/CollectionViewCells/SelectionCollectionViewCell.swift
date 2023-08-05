import UIKit

class SelectionCollectionViewCell: UICollectionViewCell {

    public var cornerRadius: CGFloat = 10
    public var style: Style = .horizontal

    override var isSelected: Bool {
        didSet {
            if isSelected {
                selectionBox.isSelected = true
            } else {
                selectionBox.isSelected = false
            }
        }
    }

    private var selectionBox = SelectionBox(width: 20)

    private lazy var mainContentView: UIView = {
        let view = UIView()
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        selectionBox.isSelected = false
    }

    public func setupCellView(mainContentView: UIView, cellStyle: Style, cornerRadius: CGFloat) {
        self.style = cellStyle
        self.cornerRadius = cornerRadius
        self.mainContentView = mainContentView
        setupView()
    }
}

extension SelectionCollectionViewCell {
    private func setupView() {
        layer.cornerRadius = cornerRadius
        [
            selectionBox,
            mainContentView
        ].forEach(addSubview(_:))
        let strategy = SelectionCellConstraintFactory.strategy(for: style)
        strategy.setupView(selectionBox: selectionBox, mainContentView: mainContentView)
    }
}

extension SelectionCollectionViewCell {
    public enum Style {
        case vertical
        case horizontal
    }
}
