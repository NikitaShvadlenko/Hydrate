import UIKit

public struct AssembledModule<ModuleInput> {
    public let viewController: UIViewController
    let moduleInput: ModuleInput

    public init(viewController: UIViewController, moduleInput: ModuleInput) {
        self.viewController = viewController
        self.moduleInput = moduleInput
    }
}
