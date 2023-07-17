import Foundation

final class OnboardingScreenWeightInteractor {
    weak var presenter: OnboardingScreenWeightInteractorOutput?
}

// MARK: - OnboardingScreenWeightInteractorInput
extension OnboardingScreenWeightInteractor: OnboardingScreenWeightInteractorInput {
    func saveDimension(_ dimension: Dimension) {
        switch dimension {
        case UnitMass.kilograms:
            print("saving", WeightMeasurementUnit.kilograms)
        case UnitMass.pounds:
            print("saving", WeightMeasurementUnit.pounds)
        default:
            fatalError("Unsupported dimension")
        }
    }
}

// MARK: - Private methods
extension OnboardingScreenWeightInteractor {
}
