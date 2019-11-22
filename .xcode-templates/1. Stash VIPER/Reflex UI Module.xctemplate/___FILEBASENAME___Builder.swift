//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import ReflexUI
import StashUI

class ___VARIABLE_productName___Builder {

    var driver: FormDriver<___VARIABLE_productName___ViewModel>!
    weak var driverInterface: ReflexUIDriverInterface!
    weak var presenter: ___VARIABLE_productName___PresenterInterface!

    func createDriver(with viewModel: ___VARIABLE_productName___ViewModel) -> FormDriver<___VARIABLE_productName___ViewModel> {
        let formFunction: Form<___VARIABLE_productName___ViewModel> =
            form([
                    section([
                        formHeaderCell(
                            title: viewModel.title,
                            body: viewModel.body
                        )
                    ]),
                    section([

                    ])
                ],
                footer([
                    button(title: viewModel.ctaTitle) {

                    }
                ])
            )

        return FormDriver(initial: viewModel, build: formFunction)
    }
}

extension ___VARIABLE_productName___Builder: ReflexUIBuilding {

    func reloadViewModel<State>(_ viewModel: State) {
        guard let model = viewModel as? ___VARIABLE_productName___ViewModel else {
            return
        }

        driver.reload(state: model)
    }

    func configure<State>(with viewModel: State, presenter: ReflexUIPresenterInterface) {
        guard let viewModel = viewModel as? ___VARIABLE_productName___ViewModel,
            let presenter = presenter as? ___VARIABLE_productName___PresenterInterface else {
                return
        }

        self.presenter = presenter
        self.driver = createDriver(with: viewModel)
        driverInterface.addFormDriver(driver)
    }
}
