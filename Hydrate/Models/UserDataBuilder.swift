import Foundation

public final class UserDataBuilder {
    public enum Error: Swift.Error {
        case goalNotSet
        case weightNotSet
        case activityLevelNotSet
        case weightMeasurementUnitNotSet
        case volumeMeasurementUnitNotSet
        case genderNotSet
    }

    public private(set) var date: Date = Date()
    public private(set) var dailyGoal: Double?
    public private(set) var weight: Double?
    public private(set) var activityLevel: ActivityLevel?
    public private(set) var weightMeasurementUnit: WeightMeasurementUnit?
    public private(set) var volumeMeasurementUnit: VolumeMeasurementUnit?
    public private(set) var gender: Gender?

    public func setGoal(_ goal: Double) {
        self.dailyGoal = goal
    }

    public func setWeight(_ weight: Double) {
        self.weight = weight
    }

    public func setActivityLevel(_ activityLevel: ActivityLevel) {
        self.activityLevel = activityLevel
    }

    public func setPreferredWeightUnit(_ weightUnit: WeightMeasurementUnit) {
        self.weightMeasurementUnit = weightUnit
    }

    public func setPreferredVolumeUnit(_ volumeUnit: VolumeMeasurementUnit) {
        self.volumeMeasurementUnit = volumeUnit
    }

    public func setGender(_ gender: Gender) {
        self.gender = gender
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
        return UserDataForm(
            date: date,
            dailyGoal: dailyGoal,
            weight: weight,
            activityLevel: activityLevel,
            weightMeasurementUnit: weightMeasurementUnit,
            volumeMeasurementUnit: volumeMeasurementUnit,
            gender: gender
        )
    }
}
