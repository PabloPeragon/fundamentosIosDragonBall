//
//  KCDragonBallTests.swift
//  KCDragonBallTests
//
//  Created by Adrián Silva on 19/12/23.
//

import XCTest
@testable import practicaDragonBall

final class practicaDragonBallTests: XCTestCase {
    private var token: String?
    
    override func setUp() {
        super.setUp()
        print("SetUp para cada test")
    }
    
    override class func setUp() {
        super.setUp()
        print("SetUp para toda la clase")
    }
    
    override func tearDown() {
        super.tearDown()
        print("TearDown para cada test")
    }
    
    override class func tearDown() {
        super.tearDown()
        print("TearDown para toda la clase")
    }

    func test_helloWorld() {
        token = "Hello World!"
        
        XCTAssertEqual(token, "Hello World!")
        XCTAssertNotEqual(token, "Hola Mundo!")
    }

    func test_notHelloWorld() {
        XCTAssertNil(token)
    }
}
