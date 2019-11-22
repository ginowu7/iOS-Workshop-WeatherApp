//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import StashModules
import ReflexUI

class ___VARIABLE_productName___Wireframe {

    weak var viewController: UIViewController?
    private let dependencyProvider: DependencyProviding

    init(dependencyProvider: DependencyProviding) {
        self.dependencyProvider = dependencyProvider
    }

    func createViewController() -> UIViewController {
        let eventTracker = ___VARIABLE_productName___EventTracker(trackersProvider: dependencyProvider)
        let presenter = ___VARIABLE_productName___Presenter(eventTracker: eventTracker)
        let interactor = ___VARIABLE_productName___Interactor(database: dependencyProvider.database, remote: dependencyProvider.remote)
        let userInterface = RenderedFormViewController.light
        let formBuilder = ___VARIABLE_productName___FormBuilder()

        userInterface.presenter = presenter
        formBuilder.driverInterface = userInterface
        interactor.output = presenter
        presenter.userInterface = userInterface
        presenter.interactor = interactor
        presenter.formBuilder = formBuilder
        presenter.wireframe = self

        return userInterface
    }
}

extension ___VARIABLE_productName___Wireframe: ViewControllerRouting {

}

extension ___VARIABLE_productName___Wireframe: ___VARIABLE_productName___WireframeInterface {

}
