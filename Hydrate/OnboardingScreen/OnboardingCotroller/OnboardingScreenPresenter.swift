import Foundation

final class OnboardingScreenPresenter {
    weak var view: OnboardingScreenViewInput?
    weak var moduleOutput: OnboardingScreenModuleOutput?
    var interactor: OnboardingScreenInteractorInput?
    var router: OnboardingScreenRouterInput?
    var builder: UserDataBuilderProtocol?
}

// MARK: - RegistrationScreenViewOutput
extension OnboardingScreenPresenter: OnboardingScreenViewOutput {
    func viewDidChooseGender(_ view: OnboardingScreenViewInput, gender: Gender) {
        builder?.setGender(gender)
    }

    func viewDidChooseTheme(_ view: OnboardingScreenViewInput, theme: Theme) {
        builder?.setTheme(theme)
    }

    func viewDidChooseGoal(_ view: OnboardingScreenViewInput, goal: Double, preferredUnits: VolumeMeasurementUnit) {
        builder?.setGoal(goal, volumeUnit: preferredUnits)
    }

    func viewDidChooseWeight(_ view: OnboardingScreenViewInput, weight: Double, preferredUnits: WeightMeasurementUnit) {
        builder?.setWeight(weight, weightUnit: preferredUnits)
    }

    func viewDidRequestGoal(_ view: OnboardingScreenViewInput, units: VolumeMeasurementUnit) -> Double {
        calculateGoal(unit: units)
    }

    func viewDidCompleteOnboarding(_ view: OnboardingScreenViewInput) {
        // TODO: save user data to interactor
        router?.routeToMainScreen()
    }

    func viewDidLoad(_ view: OnboardingScreenViewInput) {
        view.configureViews()
    }
}

// MARK: - RegistrationScreenInteractorOutput
extension OnboardingScreenPresenter: OnboardingScreenInteractorOutput {
}

// MARK: - RegistrationScreenRouterOutput
extension OnboardingScreenPresenter: OnboardingScreenRouterOutput {
}

// MARK: - RegistrationScreenModuleInput
extension OnboardingScreenPresenter: OnboardingScreenModuleInput {
    func configureModule(output: OnboardingScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension OnboardingScreenPresenter {
    private func calculateGoal(unit: VolumeMeasurementUnit) -> Double {
        guard
            let weight = builder?.weight else {
            fatalError("Weight not set")
        }
        switch unit {
        case .milliliters:
            return weight * 40
        case .ounces:
            let weightInKgs = Measurement(value: weight, unit: UnitMass.kilograms)
            let weightInPounds = weightInKgs.converted(to: .pounds).value
            return weightInPounds * 0.67
        }
    }
}
