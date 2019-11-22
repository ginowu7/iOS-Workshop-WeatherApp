//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import StashUIComponents
import StashModules

protocol ___VARIABLE_productName___UserInterface: NavigationBarDecorating, ActivityIndicatorViewing, InternalErrorAlertPresenting, AutoMockable {
    func configure(with viewModel: ___VARIABLE_productName___ViewModel)
}

protocol ___VARIABLE_productName___PresenterInterface: class {
    func didLoad()
}

protocol ___VARIABLE_productName___InteractorInput: AutoMockable {

}

protocol ___VARIABLE_productName___InteractorOutput: class, InternalErrorHandling, AutoMockable {

}

protocol ___VARIABLE_productName___WireframeInterface: Dismissable, AutoMockable {

}

protocol ___VARIABLE_productName___EventTracking: AutoMockable {

}
