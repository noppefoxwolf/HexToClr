//
//  HexToClrTests.swift
//  HexToClr
//
//  Created by Tomoya Hirano on 2016/11/21.
//
//

import XCTest
@testable import HexToClr

class HexToClrTests: XCTestCase {
  func testHexToClr() {
    let path = Bundle(for: type(of: self)).path(forResource: "sample001", ofType: "txt")
    XCTAssertNotNil(path)
    let source = Utils.parsePath(path!)
    let result = HexToClr.convert(source: source)
    XCTAssertTrue(result)
  }
}
