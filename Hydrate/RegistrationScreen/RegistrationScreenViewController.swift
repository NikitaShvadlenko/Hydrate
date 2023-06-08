import UIKit

final class RegistrationScreenViewController: UIViewController {

    private let registrationScreenView = RegistrationScreenView()

    var presenter: RegistrationScreenViewOutput?

    override func loadView() {
        view = registrationScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - RegistrationScreenViewInput
extension RegistrationScreenViewController: RegistrationScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension RegistrationScreenViewController {
}
