import UIKit

class DimensionSegmentedControl: UISegmentedControl {
    public var segmentedControlItems: [Dimension]

    init(segmentedControlItems: [Dimension], dimensionType: DimesionType) {
        self.segmentedControlItems = segmentedControlItems
        super.init(frame: .zero)
        configureSegmentedControlItems(for: segmentedControlItems, type: dimensionType)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: Private methods
extension DimensionSegmentedControl {
    private func configureSegmentedControlItems(for dimensions: [Dimension], type: DimesionType) {

        let localisedUnit: Dimension

        switch type {
        case .mass:
            localisedUnit = UnitMass(forLocale: Locale.current)
        case .volume:
            localisedUnit = UnitVolume(forLocale: Locale.current)
        }

        if let swappedDimensions = dimensions.placeElementToFirstPosition(element: localisedUnit) {
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

        switch dimension {
        case UnitVolume.fluidOunces:
            return L10n.OnboardingScreen.ounces
        default:
            formatter.locale = Locale.current
            formatter.unitStyle = .short
        }
        return formatter.string(from: dimension)
    }
}

public enum DimesionType {
    case mass
    case volume
}
