//
//  UnitTests.swift
//  UnitTests
//
//  Created by william Vise on 19/8/2022.
//

import XCTest
import UIKit
import Foundation
import SwiftUI

class UnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAssetsExist() throws {
        
        
        for x in AvailableSounds.allCases {
            let filename = StateManager.shared.setString(selectedFile: x)
            let example = UIImage(named: filename)
            XCTAssert(example != nil)
        }
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            
        }
    }

}
