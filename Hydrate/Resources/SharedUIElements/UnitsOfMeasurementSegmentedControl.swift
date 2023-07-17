import UIKit

class UnitsOfMeasurementSegmentedControl: UISegmentedControl {
    public var segmentedControlItems: [Dimension] = [] {
        didSet {
            configureSegmentedControlItems(for: segmentedControlItems)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: Private methods
extension UnitsOfMeasurementSegmentedControl {
    private func configureSegmentedControlItems(for dimensions: [Dimension]) {
        let currentUnitMass = UnitMass(forLocale: Locale.current)
        if let swappedDimensions = dimensions.placeElementToFirstPosition(element: currentUnitMass) {
            segmentedControlItems = swappedDimensions
        } else {
            segmentedControlItems = dimensions
        }

        for dimensionItemIndex in 0..<segmentedControlItems.count {
            let title = createLocalisedTitle(from: segmentedControlItems[dimensionItemIndex])
            insertSegment(withTitle: title, at: dimensionItemIndex, animated: false)
        }
    }

    func createLocalisedTitle(from dimension: Dimension) -> String {
        let formatter = MeasurementFormatter()
        formatter.locale = Locale.current
        formatter.unitStyle = .short
        return formatter.string(from: dimension)
    }
}
