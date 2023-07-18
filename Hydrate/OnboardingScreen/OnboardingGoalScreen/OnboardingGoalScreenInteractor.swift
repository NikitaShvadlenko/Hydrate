import Foundation

final class OnboardingGoalScreenInteractor {
    weak var presenter: OnboardingGoalScreenInteractorOutput?
}

// MARK: - OnboardingGoalScreenInteractorInput
extension OnboardingGoalScreenInteractor: OnboardingGoalScreenInteractorInput {
    func calculateGoal() {
        presenter?.intercactorDidCalculateGoal(self, goal: 3000)
    }

    func saveDimension(_ dimension: Dimension) {
        switch dimension {
        case UnitVolume.milliliters:
            print("saving", VolumeMeasurementUnit.milliliters)
        case UnitVolume.fluidOunces:
            print("saving", VolumeMeasurementUnit.ounces)
        default:
            fatalError("Unsupported dimension")
        }
    }
}

// MARK: - Private methods
extension OnboardingGoalScreenInteractor {
}
