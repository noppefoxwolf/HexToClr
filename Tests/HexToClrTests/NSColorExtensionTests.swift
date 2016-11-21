import XCTest
@testable import HexToClr

class NSColorExtensionTests: XCTestCase {
  
  //正しいHex
  func testColorExtensionWithValidHex() {
    let color = NSColor.make(with: "#FFF")
    XCTAssertNotNil(color)
  }
  
  //不正なHex
  func testColorExtensionInvalidHex() {
    let color = NSColor.make(with: "(^。^)")
    XCTAssertNil(color)
  }
}
