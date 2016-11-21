//
//  Utils.swift
//  HexToClr
//
//  Created by Tomoya Hirano on 2016/11/21.
//
//

import Cocoa

internal class Utils {
  static func readFile(with path: String) -> [String]? {
    guard let data = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else { return nil }
    var lines = [String]()
    data.enumerateLines { (line, stop) in
      lines.append(line)
    }
    return lines
  }
  
  
  static func convertColors(_ lines: [String]) -> [String : NSColor] {
    let regex: NSRegularExpression
    do {
      let pattern = "\\s*([#a-f0-9]{3,8})\\s*(.*)\\s*"
      regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    var colors = [String : NSColor]()
    for line in lines {
      regex.enumerateMatches(in: line,
                             options: .anchored,
                             range: NSRange(location: 0, length: line.characters.count)) { (result, flags, stop) in
                              guard let result = result else { return }
                              if result.numberOfRanges == 3 {
                                let hex  = (line as NSString).substring(with: result.rangeAt(1)) as String
                                let name = (line as NSString).substring(with: result.rangeAt(2)) as String
                                colors[name] = NSColor.make(with: hex)
                              }
      }
    }
    return colors
  }
  
  static func parsePath(_ path: String) -> (fromPath: String, toPath: String, name: String) {
    let url = URL(fileURLWithPath: path)
    let directory = url.deletingLastPathComponent()
    let name = url.lastPathComponent.components(separatedBy: ".").first ?? "color"
    let toPath = directory.appendingPathComponent(name + ".clr").path
    return (path, toPath, name)
  }
}
