//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import StashCore
@testable import stash_invest_ios

class Mock___VARIABLE_productName___UserInterface {
    var configureCallCount = 0
    var configureSpy: ___VARIABLE_productName___ViewModel?
}

extension Mock___VARIABLE_productName___UserInterface: ___VARIABLE_productName___UserInterface {

    func configure(with viewModel: ___VARIABLE_productName___ViewModel) {
        configureCallCount += 1
        configureSpy = viewModel
    }
}
