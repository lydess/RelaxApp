//
//  RelaxAppUITests.swift
//  RelaxAppUITests
//
//  Created by william Vise on 7/9/2022.
//

import XCTest
import SwiftUI
import AVFoundation

class RelaxAppUITests: XCTestCase {
    @StateObject var statem = globalstate

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPlayer() throws
    {
        let app = XCUIApplication()
        app.launchArguments = ["AUTOTEST"]
        app.launch()
        let button = app.buttons["Brown Noise"]
        let listen = app.buttons["Listen"]
        XCTAssert(button.exists)
        button.tap()
        XCTAssert(listen.exists)
        listen.tap()
       
        
        
    }
    
    func testimage() throws {
        
    }
    func testMenuNav() throws
    {
        let app = XCUIApplication()
        let button = app.buttons["Brown Noise"]
        continueAfterFailure = false
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
