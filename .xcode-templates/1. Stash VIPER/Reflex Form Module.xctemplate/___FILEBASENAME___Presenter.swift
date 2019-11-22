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
    var formBuilder: ReflexFormBuilding!

    private let eventTracker: ___VARIABLE_productName___EventTracking

    init(eventTracker: ___VARIABLE_productName___EventTracking) {
        self.eventTracker = eventTracker
    }

    private func configureNavigation() {
        let dismissButton: NavigationButton = .backArrow(action: { [weak wireframe] in wireframe?.dismiss() })
        userInterface.configureNavigation(with: .init(with: ___VARIABLE_productName___LocalizedString.navigationTitle, leftButton: dismissButton))
    }

    private func configureView() {
        formBuilder.configure(with: ___VARIABLE_productName___ViewModel(), presenter: self)
    }
}

extension ___VARIABLE_productName___Presenter: ___VARIABLE_productName___PresenterInterface {

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

    }

    func rejectViewModel(_ viewModel: ___VARIABLE_productName___ViewModel) {

    }
}

extension ___VARIABLE_productName___Presenter: ___VARIABLE_productName___InteractorOutput {

    func didEncounterInternalError() {
        userInterface.stopAnimating()
        userInterface.showInternalErrorAlert()
    }
}
