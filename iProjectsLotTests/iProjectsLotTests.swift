//
//  iProjectsLotTests.swift
//  iProjectsLotTests
//
//  Created by Smitha Ramamurthy on 26/12/17.
//  Copyright © 2017 Smitha Ramamurthy. All rights reserved.
//

import XCTest
@testable import iProjectsLot

class iProjectsLotTests: XCTestCase {
    func testInvalidFileName() {
        let file = Utils.getURLFromBundle(forFileName: "Person1")
        XCTAssertEqual(file.error, FetchError.fileNotFound, "File available in Bundle")
    }
    
    func testValidFileName() {
        let file = Utils.getURLFromBundle(forFileName: "Person")
        XCTAssertNil(file.error, "File not found in bundle")
    }
    
    func testInvalidJSONFormat() {
        let a = Person.getAllResources(fromFile: "PersonInvalidJSON")
        XCTAssertNil(a.resources, "JSONData is properly formed")
    }
}


