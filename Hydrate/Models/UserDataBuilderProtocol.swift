import Foundation

public protocol UserDataBuilderProtocol {
    var weightMeasurementUnit: WeightMeasurementUnit? { get }
    var volumeMeasurementUnit: VolumeMeasurementUnit? { get }
    var date: Date { get }
    var dailyGoal: Double? { get }
    var weight: Double? { get }
    var activityLevel: ActivityLevel? { get }
    var gender: Gender? { get }
    var theme: Theme? { get }

    func setGoal(_ goal: Double, volumeUnit: VolumeMeasurementUnit)
    func setWeight(_ weight: Double, weightUnit: WeightMeasurementUnit)
    func setActivityLevel(_ activityLevel: ActivityLevel)
    func setGender(_ gender: Gender)
    func setTheme(_ theme: Theme)
    func build() throws -> UserDataForm
}
