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
    func viewDidChooseActivityLevel(_ view: OnboardingScreenViewInput, activityLevel: ActivityLevel) {
        builder?.setActivityLevel(activityLevel)
    }

    func viewDidChooseGender(_ view: OnboardingScreenViewInput, gender: Gender) {
        builder?.setGender(gender)
    }

    func viewDidChooseTheme(_ view: OnboardingScreenViewInput, theme: Theme) {
        builder?.setTheme(theme)
    }

    func viewDidChooseGoal(_ view: OnboardingScreenViewInput, goal: Double, preferredUnits: Dimension) {
        builder?.setGoal(goal, volumeUnit: preferredUnits)
    }

    func viewDidChooseWeight(_ view: OnboardingScreenViewInput, weight: Double, preferredUnits: Dimension) {
        builder?.setWeight(weight, weightUnit: preferredUnits)
    }

    func viewDidRequestGoal(_ view: OnboardingScreenViewInput, units: Dimension) -> Double {
        calculateGoal(unit: units)
    }

    func viewDidCompleteOnboarding(_ view: OnboardingScreenViewInput) {
        guard let userData = try? builder?.build() else { return }
        print("Built the following:")
        //swiftlint:disable line_length
        print("Gender: \(userData.gender), goal: \(userData.dailyGoal), activity level: \(userData.activityLevel), weightMeasurement: \(userData.weightMeasurementUnit.rawValue), weight: \(userData.weight), volumeUnit: \(userData.volumeMeasurementUnit)")
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
    private func calculateGoal(unit: Dimension) -> Double {
        guard
            let weight = builder?.weight else {
            fatalError("Weight not set")
        }
        builder?.setVolumeMeasurementUnit(unit)
        switch builder?.volumeMeasurementUnit {
        case .milliliters:
            return weight * 40
        case .ounces:
            let weightInKgs = Measurement(value: weight, unit: UnitMass.kilograms)
            let weightInPounds = weightInKgs.converted(to: .pounds).value
            return weightInPounds * 0.67
        case .none:
            fatalError("Dimension was not set")
        }
    }
}
