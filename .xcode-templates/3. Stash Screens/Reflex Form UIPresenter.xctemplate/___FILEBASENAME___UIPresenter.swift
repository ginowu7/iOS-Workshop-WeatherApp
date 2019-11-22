//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import StashCore
import StashUI
import StashUIComponents
import ReflexUI

class ___VARIABLE_productName___UIPresenter: NavigationBinding {

    weak var userInterface: (UIViewController & ReflexUIUserInterface & ReflexUIDriverInterface)!
    var formBuilder: ReflexFormBuilding!
    public var next: NextAction?

    public required init() {}

    public func bindInterface() -> UIViewController {
        let builder = ___VARIABLE_productName___FormBuilder()
        self.formBuilder = builder

        let formViewController = RenderedFormViewController.light
        self.userInterface = formViewController

        builder.driverInterface = formViewController
        formViewController.presenter = self

        return formViewController
    }

    private func configureNavigation() {
        let dismiss: () -> Void = { [weak self] in self?.dismiss() }
        let model = NavigationViewModel(with: ___VARIABLE_productName___LocalizedString.navigationTitle,
                                        leftButton: .backArrow(action: dismiss))
        userInterface.configureNavigation(with: model)
    }

    private func configureView() {
        formBuilder.configure(with: ___VARIABLE_productName___ViewModel(), presenter: self)
    }

    private func dismiss() {
        userInterface.navigationController?.popViewController(animated: true)
    }
}

extension ___VARIABLE_productName___UIPresenter: ___VARIABLE_productName___PresenterInterface {

    func didLoad() {
        configureView()
    }

    func willAppear() {
        configureNavigation()
    }

    func validate() {
        formBuilder.validate()
    }

    func acceptViewModel(_ viewModel: ___VARIABLE_productName___ViewModel) {
        dismiss()
    }

    func rejectViewModel(_ viewModel: ___VARIABLE_productName___ViewModel) {
        dismiss()
    }
}
