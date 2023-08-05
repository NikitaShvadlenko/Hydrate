import UIKit

// swiftlint:disable line_length
/**
 Subclass this cell to create a custom selection cell.

 Make sure to call `setupCellView(_:cellStyle:cornerRadius:)` method in your subclass's `init` method to configure the cell's appearance properly.
 */
public class SelectionCollectionViewCell: UICollectionViewCell {
    public var cornerRadius: CGFloat = 10
    public var style: Style = .horizontal

    public override var isSelected: Bool {
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
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    public override func prepareForReuse() {
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
