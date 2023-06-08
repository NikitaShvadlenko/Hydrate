import Foundation

struct UserDataForm {
    var date: Date
    var dailyGoal: Double
    var weight: Double
    var exerciseLevel: ExerciseLevel
    var weightMeasurementUnit: WeightMeasurementUnit
    var volumeMeasurementUnit: VolumeMeasurementUnit
}

enum ExerciseLevel: String {
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
