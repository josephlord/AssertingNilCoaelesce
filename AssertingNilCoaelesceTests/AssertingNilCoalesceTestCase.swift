//
//  AssertingNilCoalesceTestCase.swift
//
//
//  Created by Joseph on 02/12/2014.
//  Copyright (c) 2014 Human Friendly Ltd. All rights reserved.
//

import XCTest
import AssertingNilCoaelesce

class AssertingNilCoalesceTestCase: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNonNil() {
        // This is an example of a functional test case.
        let fiveO:Int? = 5
        func shouldNotBeCalled()->Int { XCTAssert(false, "The RHS should not be evaluated"); return 0 }
        let nn = fiveO !! shouldNotBeCalled()

        XCTAssertEqual(nn, 5)
    }
    
    func testNil() {
        let nilO:[Int]? = nil
        
        #if DEBUG
            // TODO: spawn a process and check for signal back
            //           XCTAssertThrows(nilO !! [5])
            XCTAssert(false, "Untested case, assertion should be raised if !! is called on nil")
        #else
            let rhsIsCalled = expectationWithDescription("RHS should be called")
            let shouldBeCalled:()->[Int] = { rhsIsCalled.fulfill(); return [5] }
            let res = nilO !! shouldBeCalled()
            XCTAssertEqual(res, [5])
            waitForExpectationsWithTimeout(3, handler: nil)
        #endif
    }
}
