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
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setHidesBackButton(true, animated: false)
        title = L10n.RegistrationScreen.welcome
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
