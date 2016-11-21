//
//  NSColor+Extensions.swift
//  HexToClr
//
//  Created by Tomoya Hirano on 2016/11/21.
//
//

import Cocoa

internal extension NSColor {
  static func make(with hex: String) -> NSColor? {
    var colorString = hex.replacingOccurrences(of: "#", with: "").uppercased()
    colorString = colorString.trimmingCharacters(in: .whitespacesAndNewlines)
    var alpha: CGFloat = 1.0
    var red: CGFloat = 1.0
    var blue: CGFloat = 1.0
    var green: CGFloat = 1.0
    switch colorString.characters.count {
    case 3:
      red = colorComponent(from: colorString, start: 0, length: 1)
      green = colorComponent(from: colorString, start: 1, length: 1)
      blue = colorComponent(from: colorString, start: 2, length: 1)
    case 4:
      alpha = colorComponent(from: colorString, start: 0, length: 1)
      red = colorComponent(from: colorString, start: 1, length: 1)
      green = colorComponent(from: colorString, start: 2, length: 1)
      blue = colorComponent(from: colorString, start: 3, length: 1)
    case 6:
      red = colorComponent(from: colorString, start: 0, length: 2)
      green = colorComponent(from: colorString, start: 2, length: 2)
      blue = colorComponent(from: colorString, start: 4, length: 2)
    case 8:
      alpha = colorComponent(from: colorString, start: 0, length: 2)
      red = colorComponent(from: colorString, start: 2, length: 2)
      green = colorComponent(from: colorString, start: 4, length: 2)
      blue = colorComponent(from: colorString, start: 6, length: 2)
    default: return nil
    }
    return NSColor(calibratedRed: red, green: green, blue: blue, alpha: alpha)
  }
  
  private static func colorComponent(from string: String, start: Int, length: Int) -> CGFloat {
    let startIndex = string.index(string.startIndex, offsetBy: start)
    let endIndex = string.index(string.startIndex, offsetBy: start+length)
    let range = startIndex..<endIndex
    
    let subString = string.substring(with: range)
    let fullHex = length == 2 ? subString : ( subString + subString )
    let hexComponent = UnsafeMutablePointer<UInt32>.allocate(capacity: 1)
    Scanner(string: fullHex).scanHexInt32(hexComponent)
    return CGFloat(hexComponent.pointee) / 255.0
  }
}
