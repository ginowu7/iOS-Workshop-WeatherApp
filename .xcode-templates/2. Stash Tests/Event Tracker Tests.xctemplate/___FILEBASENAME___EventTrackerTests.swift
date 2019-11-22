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
import StashModulesMocks
@testable import ___WORKSPACENAME___

class ___VARIABLE_productName___EventTrackerTests: XCTestCase {

    var productEventTracker: MockProductEventTracking!
    var trackersProvider: MockEventTrackersProviding!
    var eventTracker: ___VARIABLE_productName___EventTracker!

    override func setUp() {
        super.setUp()

        productEventTracker = MockProductEventTracking()
        trackersProvider = MockEventTrackersProviding()
        trackersProvider.productEventTrackerStub = productEventTracker
        eventTracker = ___VARIABLE_productName___EventTracker(trackersProvider: trackersProvider)
    }

    override func tearDown() {
        super.tearDown()

        trackersProvider = nil
        eventTracker = nil
        productEventTracker = nil
    }
}

extension ___VARIABLE_productName___EventTrackerTests {

    func test_when<#Condition#>_<#Expectation#>() {

    }
}
