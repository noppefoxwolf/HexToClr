//
//  UtilsTests.swift
//  HexToClr
//
//  Created by Tomoya Hirano on 2016/11/21.
//
//

import XCTest
@testable import HexToClr

class UtilsTests: XCTestCase {
  func testReadFileWithInvalidPath() {
    let lines = Utils.readFile(with: "(^。^)")
    XCTAssertNil(lines)
  }
  
  func testReadFileWithValidPath() {
    let path = Bundle(for: type(of: self)).path(forResource: "sample001", ofType: "txt")
    XCTAssertNotNil(path)
    let lines = Utils.readFile(with: path!)
    XCTAssertNotNil(lines)
  }
  
  func testConvertColor() {
    let colors = Utils.convertColors(["#000 none"])
    XCTAssertTrue(colors.count == 1)
    XCTAssertTrue(colors.first?.key == "none")
    XCTAssertTrue(colors.first?.value.redComponent == 0.0)
    XCTAssertTrue(colors.first?.value.greenComponent == 0.0)
    XCTAssertTrue(colors.first?.value.blueComponent == 0.0)
  }
  
  func testConvertMultiColor() {
    let colors = Utils.convertColors(["#000 none", "FFF white", "wake up"])
    XCTAssertTrue(colors.count == 2)
  }
  
  func testParseWithInvalidPath() {
    let (from, to, name) = Utils.parsePath("/hoge/foo/color.txt")
    XCTAssertTrue(from == "/hoge/foo/color.txt")
    XCTAssertTrue(to == "/hoge/foo/color.clr", "Faild: \(to)")
    XCTAssertTrue(name == "color")
  }
}
