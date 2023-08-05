import Foundation

public final class UserDataBuilder: UserDataBuilderProtocol {

    private enum Error: Swift.Error, LocalizedError {
        case goalNotSet
        case weightNotSet
        case activityLevelNotSet
        case weightMeasurementUnitNotSet
        case volumeMeasurementUnitNotSet
        case genderNotSet
        case themeNotSet

        var errorDescription: String {
            switch self {
            case .goalNotSet:
                return "Goal not set."
            case .weightNotSet:
                return "Weight not set."
            case .activityLevelNotSet:
                return "Activity level not set."
            case .weightMeasurementUnitNotSet:
                return "Weight measurement unit not set."
            case .volumeMeasurementUnitNotSet:
                return "Volume measurement unit not set."
            case .genderNotSet:
                return "Gender not set."
            case .themeNotSet:
                return "Theme not set."
            }
        }
    }

    public private(set) var date: Date = Date()
    public private(set) var dailyGoal: Double?
    public private(set) var weight: Double?
    public private(set) var activityLevel: ActivityLevel?
    public private(set) var weightMeasurementUnit: WeightMeasurementUnit?
    public private(set) var volumeMeasurementUnit: VolumeMeasurementUnit?
    public private(set) var gender: Gender?
    public private(set) var theme: Theme?

    public func setVolumeMeasurementUnit(_ volumeUnit: Dimension) {

        switch volumeUnit {
        case UnitVolume.milliliters:
            self.volumeMeasurementUnit = .milliliters
        case UnitVolume.fluidOunces:
            self.volumeMeasurementUnit = .ounces
        default:
            fatalError("Unknown dimension")
        }
    }

    public func setGoal(_ goal: Double, volumeUnit: Dimension) {

        switch volumeUnit {
        case UnitVolume.milliliters:
            self.volumeMeasurementUnit = .milliliters
            self.dailyGoal = goal
        case UnitVolume.fluidOunces:
            self.volumeMeasurementUnit = .ounces
            let goalInOunces = Measurement(value: goal, unit: UnitVolume.fluidOunces)
            let dailyGoal = goalInOunces.converted(to: .milliliters)
            self.dailyGoal = dailyGoal.value
        default:
            fatalError("Unknown dimension")
        }
    }

    public func setWeight(_ weight: Double, weightUnit: Dimension) {
        switch weightUnit {
        case UnitMass.kilograms:
            self.weightMeasurementUnit = .kilograms
            self.weight = weight
        case UnitMass.pounds:
            self.weightMeasurementUnit = .pounds
            let weightInPounds = Measurement(value: weight, unit: UnitMass.pounds)
            let weight = weightInPounds.converted(to: .kilograms).value
            self.weight = weight
        default:
            fatalError("Unknown dimension")
        }
    }

    public func setActivityLevel(_ activityLevel: ActivityLevel) {
        self.activityLevel = activityLevel
    }

    public func setGender(_ gender: Gender) {
        self.gender = gender
    }

    public func setTheme(_ theme: Theme) {
        self.theme = theme
    }

    public func build() throws -> UserDataForm {
        guard let dailyGoal = dailyGoal else {
            throw Error.goalNotSet
        }
        guard let weight = weight else {
            throw Error.weightNotSet
        }
        guard let activityLevel = activityLevel else {
            throw Error.activityLevelNotSet
        }
        guard let weightMeasurementUnit = weightMeasurementUnit else {
            throw Error.weightMeasurementUnitNotSet
        }
        guard let volumeMeasurementUnit = volumeMeasurementUnit else {
            throw Error.volumeMeasurementUnitNotSet
        }
        guard let gender = gender else {
            throw Error.genderNotSet
        }
        guard let theme = theme else {
            throw Error.themeNotSet
        }

        return UserDataForm(
            date: date,
            dailyGoal: dailyGoal,
            weight: weight,
            activityLevel: activityLevel,
            weightMeasurementUnit: weightMeasurementUnit,
            volumeMeasurementUnit: volumeMeasurementUnit,
            gender: gender,
            theme: theme
        )
    }
}

// MARK: - Private functions
extension UserDataBuilder {

}
