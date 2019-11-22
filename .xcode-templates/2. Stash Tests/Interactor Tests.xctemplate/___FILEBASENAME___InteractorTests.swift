//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import XCTest
import StashCore
import StashCoreMocks
@testable import ___WORKSPACENAME___

class ___VARIABLE_productName___InteractorTests: XCTestCase {

    var interactor: ___VARIABLE_productName___Interactor!
    var output: Mock___VARIABLE_productName___InteractorOutput!
    var database: MockSTIDatabase!
    var remote: MockSTIRemoteType!

    override func setUp() {
        super.setUp()

        database = MockSTIDatabase()
        remote = MockSTIRemoteType()
        output = Mock___VARIABLE_productName___InteractorOutput()
        interactor = ___VARIABLE_productName___Interactor(database: database, remote: remote)
        interactor.output = output
    }

    override func tearDown() {
        super.tearDown()

        database = nil
        remote = nil
        output = nil
        interactor = nil
    }
}

extension ___VARIABLE_productName___InteractorTests {

    func test_when<#Condition#>_<#Expectation#>() {

    }
}
