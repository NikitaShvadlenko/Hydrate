import UIKit

class UnitsOfMeasurementSegmentedControl: UISegmentedControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSegmentedControlTitles()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: Private methods
extension UnitsOfMeasurementSegmentedControl {
    private func setupView() {
    }

    private func configureSegmentedControlTitles() {
        let currentUnitMass = UnitMass(forLocale: Locale.current)
        print(Locale.current)
        let kilogramSymbol = UnitMass.kilograms.symbol
        let poundSymbol = UnitMass.pounds.symbol
        print(currentUnitMass.symbol)

        switch currentUnitMass {
        case .kilograms:
            insertSegment(withTitle: kilogramSymbol, at: 0, animated: false)
            insertSegment(withTitle: poundSymbol, at: 1, animated: false)
        case .pounds:
            insertSegment(withTitle: poundSymbol, at: 0, animated: false)
            insertSegment(withTitle: kilogramSymbol, at: 1, animated: false)
        default:
            insertSegment(withTitle: kilogramSymbol, at: 0, animated: false)
            insertSegment(withTitle: poundSymbol, at: 1, animated: false)
        }
            selectedSegmentIndex = 0
    }
}
