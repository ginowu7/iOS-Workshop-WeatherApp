//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import XCTest
import StashCore
@testable import ___WORKSPACENAME___

class ___VARIABLE_productName___PresenterTests: XCTestCase {

    var presenter: ___VARIABLE_productName___Presenter!
    var wireframe: Mock___VARIABLE_productName___WireframeInterface!
    var userInterface: Mock___VARIABLE_productName___UserInterface!
    var eventTracker: Mock___VARIABLE_productName___EventTracking!

    override func setUp() {
        super.setUp()

        wireframe = Mock___VARIABLE_productName___WireframeInterface()
        userInterface = Mock___VARIABLE_productName___UserInterface()
        eventTracker = Mock___VARIABLE_productName___EventTracking()
        presenter = ___VARIABLE_productName___Presenter(eventTracker: eventTracker)

        presenter.wireframe = wireframe
        presenter.userInterface = userInterface
    }

    override func tearDown() {
        super.tearDown()

        userInterface = nil
        wireframe = nil
        presenter = nil
        eventTracker = nil
    }
}

private typealias LifecycleTests = ___VARIABLE_productName___PresenterTests
extension LifecycleTests {

    func test_whenViewIsLoaded_<#Expectation#>() {
        presenter.didLoad()

        XCTAssertEqual()
    }

}

private typealias ActionTests = ___VARIABLE_productName___PresenterTests
extension ActionTests {

    func test_when<#Expectation#>() {
        XCTAssertEqual()
    }

}

private typealias EventTests = ___VARIABLE_productName___PresenterTests
extension EventTests {

    func test_when<#Expectation#>_eventIsSent() {
        presenter.didLoad()

        XCTAssertEqual()
    }

}
