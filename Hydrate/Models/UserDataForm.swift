import Foundation

public struct UserDataForm {
    var date: Date
    var dailyGoal: Double
    var weight: Double
    var activityLevel: ActivityLevel
    var weightMeasurementUnit: WeightMeasurementUnit
    var volumeMeasurementUnit: VolumeMeasurementUnit
    var gender: Gender
}

public enum ActivityLevel: String, CaseIterable {
    case light
    case moderate
    case heavy
}

public enum VolumeMeasurementUnit: String {
    case milliliters
    case ounces
}

public enum WeightMeasurementUnit: String {
    case kilograms
    case pounds
}

public enum Gender: String, CaseIterable {
    case male
    case female
    case other
}

public enum Theme: String, CaseIterable {
    case green
    case blue
    case red
}
