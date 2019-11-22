//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import StashCore
import StashUIComponents
import StashModules

class ___VARIABLE_productName___Presenter {

    weak var userInterface: ValuePropositionUserInterface!
    var wireframe: ___VARIABLE_productName___WireframeInterface!

    private let eventTracker: ___VARIABLE_productName___EventTracking

    init(eventTracker: ___VARIABLE_productName___EventTracking) {
        self.eventTracker = eventTracker
    }

    private func proceed() {
        // TODO: Track yo self
        wireframe.proceed()
    }

    private func configureNavigation() {
        let viewModel = NavigationViewModel.leftXButton { [weak wireframe] in
            wireframe?.dismiss()
        }

        userInterface.configureNavigation(with: viewModel)
    }

    private func configureView() {
        let viewModel = ValuePropositionViewModel.___VARIABLE_productNameCamelCase___ { [weak self] in
            self?.proceed()
        }

        userInterface.configure(viewModel)
    }
}

extension ___VARIABLE_productName___Presenter: ValuePropositionPresenterInterface {

    func didLoad() {
        configureNavigation()
        configureView()
    }
}
