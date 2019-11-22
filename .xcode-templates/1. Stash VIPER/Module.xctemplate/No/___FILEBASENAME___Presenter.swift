//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import StashUIComponents

class ___VARIABLE_productName___Presenter {

    weak var userInterface: ___VARIABLE_productName___UserInterface!
    var wireframe: ___VARIABLE_productName___WireframeInterface!

    private let eventTracker: ___VARIABLE_productName___EventTracking

    init(eventTracker: ___VARIABLE_productName___EventTracking) {
        self.eventTracker = eventTracker
    }

    private func configureNavigation() {

    }

    private func configureView() {
        userInterface.configure(with: .initial)
    }
}

extension ___VARIABLE_productName___Presenter: ___VARIABLE_productName___PresenterInterface {

    func didLoad() {
        configureNavigation()
        configureView()
    }
}
