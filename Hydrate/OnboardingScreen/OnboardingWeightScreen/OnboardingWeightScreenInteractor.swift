import Foundation

final class OnboardingWeightScreenInteractor {
    weak var presenter: OnboardingWeightScreenInteractorOutput?
}

// MARK: - OnboardingWeightScreenInteractorInput
extension OnboardingWeightScreenInteractor: OnboardingWeightScreenInteractorInput {
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
extension OnboardingWeightScreenInteractor {
}
