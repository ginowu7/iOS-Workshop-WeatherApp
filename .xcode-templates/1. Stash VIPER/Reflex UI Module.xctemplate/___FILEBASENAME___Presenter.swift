//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import StashUIComponents
import ReflexUI

class ___VARIABLE_productName___Presenter {

    weak var userInterface: ReflexUIUserInterface!
    var interactor: ___VARIABLE_productName___InteractorInput!
    var wireframe: ___VARIABLE_productName___WireframeInterface!
    var builder: ReflexUIBuilding!

    private let eventTracker: ___VARIABLE_productName___EventTracking

    init(eventTracker: ___VARIABLE_productName___EventTracking) {
        self.eventTracker = eventTracker
    }

    private func configureNavigation() {
        let dismissButton: NavigationButton = .backArrow(action: { [weak wireframe] in
            wireframe?.dismiss()
        })
        userInterface.configureNavigation(with: .init(with: ___VARIABLE_productName___LocalizedString.navigationTitle, leftButton: dismissButton))
    }

    private func configureView() {
        builder.configure(with: ___VARIABLE_productName___ViewModel(), presenter: self)
    }
}

extension ___VARIABLE_productName___Presenter: ___VARIABLE_productName___PresenterInterface {

    func didLoad() {
        configureView()
    }

    func willAppear() {
        configureNavigation()
    }
}

extension ___VARIABLE_productName___Presenter: ___VARIABLE_productName___InteractorOutput {

    func didEncounterInternalError() {
        userInterface.stopAnimating()
        userInterface.showInternalErrorAlert()
    }
}
