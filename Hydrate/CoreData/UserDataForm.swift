import Foundation

struct UserDataForm {
    var date: Date
    var dailyGoal: Double
    var weight: Double
    var activityLevel: ActivityLevel
    var weightMeasurementUnit: WeightMeasurementUnit
    var volumeMeasurementUnit: VolumeMeasurementUnit
    var gender: Gender
}

enum ActivityLevel: String, CaseIterable {
    case light
    case moderate
    case heavy
}

enum VolumeMeasurementUnit: String {
    case liters
    case milliliters
    case ounces
    case cups
}

enum WeightMeasurementUnit: String {
    case kilograms
    case pounds
}

enum Gender: String, CaseIterable {
    case male
    case female
    case other
}

enum Theme: String, CaseIterable {
    case green
    case blue
    case red
}
