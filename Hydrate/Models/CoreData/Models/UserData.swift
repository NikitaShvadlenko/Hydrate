import CoreData

final class UserData: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var dailyGoal: Int

    @NSManaged
    fileprivate(set) var weight: Double

    @NSManaged
    fileprivate(set) var activityLevelRawValue: String

    @NSManaged
    fileprivate(set) var genderRawValue: String

    @NSManaged
    fileprivate(set) var weightMeasurementUnitRawValue: String

    @NSManaged
    fileprivate(set) var volumeMeasurementUnitRawValue: String

    static func insert(
        into context: NSManagedObjectContext,
        form: UserDataForm
    ) {
        context.performChanges {
            let userData: UserData = context.insertObject()
            userData.dailyGoal = form.dailyGoal
            userData.weight = form.weight
            userData.genderRawValue = form.gender.rawValue
            userData.activityLevelRawValue = form.activityLevel.rawValue
            userData.weightMeasurementUnitRawValue = form.weightMeasurementUnit.rawValue
            userData.volumeMeasurementUnitRawValue = form.volumeMeasurementUnit.rawValue
            userData.date = Date()
        }
    }

    static func updateUserData(
        object: UserData,
        into context: NSManagedObjectContext,
        form: UserDataForm
    ) {
        guard let updateObject = context.object(with: object.objectID) as? Self else { return }
        // updateObject.dailyGoal = form.dailyGoal
        updateObject.weight = form.weight
        updateObject.activityLevelRawValue = form.activityLevel.rawValue
        updateObject.weightMeasurementUnitRawValue = form.weightMeasurementUnit.rawValue
        updateObject.volumeMeasurementUnitRawValue = form.volumeMeasurementUnit.rawValue
    }

    public static func goal(context: NSManagedObjectContext) -> Int {
        let fetchRequest = UserData.sortedFetchRequest
        do {
            let userData = try context.fetch(fetchRequest)
            guard let userData = userData.first else {
                fatalError("User profile was not created")
            }
            return userData.dailyGoal
        } catch {
            fatalError("Could not fetch user data")
        }
    }
}

extension UserData: Managed {
}

extension UserData {
    var activityLevel: ActivityLevel {
        get {
            guard let activityLevel = ActivityLevel(rawValue: activityLevelRawValue) else {
                fatalError("Failed to convert")
            }
            return activityLevel
        }
        set {
            activityLevelRawValue = newValue.rawValue
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
