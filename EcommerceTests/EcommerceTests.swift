//
//  EcommerceTests.swift
//  EcommerceTests
//
//  Created by Илья on 08.04.2020.
//  Copyright © 2020 Илья. All rights reserved.
//

import XCTest
@testable import Ecommerce
import Cuckoo
import Alamofire

class AuthorizationControllerMock: AuthorizationController {
    var suspended = false
    var suspendedLogin = false

    override func login(username: String, password: String) {
        super.login(username: username, password: password)
        suspendedLogin = true
    }

    override func showError() {
        suspended = true
    }
}

func sum(value: Int, valueTwo: Int) -> Int {
    return value + valueTwo
}

class EcommerceTests: XCTestCase {

    let expectation = XCTestExpectation(description: "test")

    override func setUp() {

    }

    func testSum() {
        // when
        let first = 5
        let second = 10

        // then
        let result = sum(value: first, valueTwo: second)

        XCTAssert(result == 15)
    }

    func testAuthorizeLogin() {
        // when
        let username = "testUsername"
        let password = "testPassword"
        let controller = MockAuthorizationController().withEnabledSuperclassSpy()
        let router = AuthorizationRouter(view: controller)
        let presenter = MockAuthorizationPresenter(view: controller,
                                                   router: router,
                                                   authService: RequestFactory().makeAuthRequestFatory())
        stub(presenter) { stub in
            when(stub).requestToServer().thenReturn(100)
            when(stub).login(username: anyString(), password: "123").then { (_, _) in
                print("OK")
            }
        }
        controller.presenter = presenter

        // then
        controller.login(username: "123456", password: "123")

        // result
        //verify(controller).showError()
    }

    override func tearDown() {

    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
