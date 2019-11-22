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
import ReflexUI

protocol ___VARIABLE_productName___PresenterInterface: ReflexFormPresenterInterface {
    func acceptViewModel(_ viewModel: ___VARIABLE_productName___ViewModel)
    func rejectViewModel(_ viewModel: ___VARIABLE_productName___ViewModel)
}

protocol ___VARIABLE_productName___InteractorInput: ___PROJECTNAME___AutoMockable {

}

protocol ___VARIABLE_productName___InteractorOutput: class, InternalErrorHandling, ___PROJECTNAME___AutoMockable {

}

protocol ___VARIABLE_productName___WireframeInterface: Dismissable, ___PROJECTNAME___AutoMockable {

}

protocol ___VARIABLE_productName___EventTracking: ___PROJECTNAME___AutoMockable {

}
