import Foundation

public protocol UserDataBuilderProtocol {
    var weightMeasurementUnit: WeightMeasurementUnit? { get }
    var volumeMeasurementUnit: VolumeMeasurementUnit? { get }
    var date: Date { get }
    var dailyGoal: Double? { get }
    var weight: Double? { get }
    var activityLevel: ActivityLevel? { get }
    var gender: Gender? { get }

    func setGoal(_ goal: Double)
    func setWeight(_ weight: Double)
    func setActivityLevel(_ activityLevel: ActivityLevel)
    func setPreferredWeightUnit(_ weightUnit: WeightMeasurementUnit)
    func setPreferredVolumeUnit(_ volumeUnit: VolumeMeasurementUnit)
    func setGender(_ gender: Gender)
    func build() throws -> UserDataForm
}
