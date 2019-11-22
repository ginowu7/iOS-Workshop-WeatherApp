//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import StashModules

public class ___VARIABLE_productName___Wireframe {

    public weak var viewController: UIViewController?
    public let dependencyProvider: DependencyProviding

    public init(dependencyProvider: DependencyProviding) {
        self.dependencyProvider = dependencyProvider
    }

    public func createViewController() -> UIViewController {
        let eventTracker = ___VARIABLE_productName___EventTracker(trackersProvider: dependencyProvider)
        let presenter = ___VARIABLE_productName___Presenter(eventTracker: eventTracker)
        let userInterface = ValuePropositionViewController(presenter: presenter)

        presenter.userInterface = userInterface
        presenter.wireframe = self

        return userInterface
    }
}

extension ___VARIABLE_productName___Wireframe: ViewControllerRouting {

}

extension ___VARIABLE_productName___Wireframe: ___VARIABLE_productName___WireframeInterface {

    func proceed() {
        // TODO: Go somewhere, eh
    }
}
