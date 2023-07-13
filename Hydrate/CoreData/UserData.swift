import CoreData

final class UserData: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var dailyGoal: Double

    @NSManaged
    fileprivate(set) var weight: Double

    @NSManaged
    fileprivate(set) var exerciseLevelRawValue: String

    @NSManaged
    fileprivate(set) var genderRawValue: String

    @NSManaged
    fileprivate(set) var weightMeasurementUnitRawValue: String

    @NSManaged
    fileprivate(set) var volumeMeasurementUnitRawValue: String

    static func insert(
        into context: NSManagedObjectContext,
        form: UserDataForm
    ) -> UserData {
        let userData: UserData = context.insertObject()
        userData.dailyGoal = form.dailyGoal
        userData.weight = form.weight
        userData.genderRawValue = form.gender.rawValue
        userData.exerciseLevelRawValue = form.exerciseLevel.rawValue
        userData.weightMeasurementUnitRawValue = form.weightMeasurementUnit.rawValue
        userData.volumeMeasurementUnitRawValue = form.volumeMeasurementUnit.rawValue
        userData.date = Date()
        return userData
    }

    static func updateUserData(
        object: UserData,
        into context: NSManagedObjectContext,
        form: UserDataForm
    ) {
        guard let updateObject = context.object(with: object.objectID) as? Self else { return }
        updateObject.dailyGoal = form.dailyGoal
        updateObject.weight = form.weight
        updateObject.exerciseLevelRawValue = form.exerciseLevel.rawValue
        updateObject.weightMeasurementUnitRawValue = form.weightMeasurementUnit.rawValue
        updateObject.volumeMeasurementUnitRawValue = form.volumeMeasurementUnit.rawValue
    }
}

extension UserData: Managed {
}

extension UserData {
    var exerciseLevel: ExerciseLevel {
        get {
            guard let exerciseLevel = ExerciseLevel(rawValue: exerciseLevelRawValue) else {
                fatalError("Failed to convert")
            }
            return exerciseLevel
        }
        set {
            exerciseLevelRawValue = newValue.rawValue
        }
    }

    var volumeMeasurementUnit: VolumeMeasurementUnit {
        get {
            guard let volumeMeasurementUnit = VolumeMeasurementUnit(rawValue: volumeMeasurementUnitRawValue) else {
                fatalError("Failed to convert")
            }
            return volumeMeasurementUnit
        }
        set {
            volumeMeasurementUnitRawValue = newValue.rawValue
        }
    }

    var weightMeasurementUnit: WeightMeasurementUnit {
        get {
            guard let weightMeasurementUnit = WeightMeasurementUnit(rawValue: weightMeasurementUnitRawValue) else {
                fatalError("Failed to convert")
            }
            return weightMeasurementUnit
        }
        set {
            weightMeasurementUnitRawValue = newValue.rawValue
        }
    }

    var gender: Gender {
        get {
            guard let gender = Gender(rawValue: genderRawValue) else {
                fatalError("Failed to convert")
            }
            return gender
        }
        set {
            genderRawValue = newValue.rawValue
        }
    }
}
