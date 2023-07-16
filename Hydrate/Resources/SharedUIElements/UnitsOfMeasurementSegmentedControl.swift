import UIKit

class UnitsOfMeasurementSegmentedControl: UISegmentedControl {
    var segmentedControlItems: [Unit]?

    override init(frame: CGRect) {
        super.init(frame: frame)
        segmentedControlItems = [UnitMass.carats, UnitMass.kilograms, UnitMass.carats, UnitMass.grams]
        if let segmentedControlItems = segmentedControlItems as? [UnitMass] {
            configureSegmentedControlTitles(for: segmentedControlItems)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: Private methods
extension UnitsOfMeasurementSegmentedControl {
    private func setupView() {
    }

    private func configureSegmentedControlTitles(for mass: [UnitMass]) {


        let formatter = MeasurementFormatter()
        formatter.locale = Locale.current

        let kilogramSymbol = UnitMass.kilograms.symbol
        print(formatter.string(from: Measurement.init(value: 0, unit: UnitMass.grams)))
        let poundSymbol = UnitMass.pounds.symbol
        let currentUnitMass = placeCurrentUnitFirst(units: mass, currentUnit: UnitMass(forLocale: Locale.current))
        currentUnitMass.forEach( {print($0.symbol)} )

        //        switch currentUnitMass {
        //        case .kilograms:
        //            insertSegment(withTitle: kilogramSymbol, at: 0, animated: false)
        //            insertSegment(withTitle: poundSymbol, at: 1, animated: false)
        //        case .pounds:
        //            insertSegment(withTitle: poundSymbol, at: 0, animated: false)
        //            insertSegment(withTitle: kilogramSymbol, at: 1, animated: false)
        //        default:
        //            insertSegment(withTitle: kilogramSymbol, at: 0, animated: false)
        //            insertSegment(withTitle: poundSymbol, at: 1, animated: false)
        //        }
        //            selectedSegmentIndex = 0
    }

    private func placeCurrentUnitFirst<T: Equatable>(units: [T], currentUnit: T) -> [T] {
        var unitsArray: [T] = []

        if let localUnit = units.first(where: { $0 == currentUnit }) {
            unitsArray.append(currentUnit)
            units.forEach { unit in
                if unit != currentUnit {
                    unitsArray.append(unit)
                }
            }
            return unitsArray
        }

        return []
    }

}

extension Array where Element: Equatable {
    func placeElementToFirstPosition(element: Element) -> [Element]? {
        var newArray: [Element] = []

        if let localElement = self.first(where: { $0 == element }) {
            newArray.append(localElement)
            self.forEach { item in
                if item != element {
                    newArray.append(item)
                }
            }
            return newArray
        }
        return nil
    }
}
