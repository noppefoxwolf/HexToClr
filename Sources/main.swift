//
//  main.swift
//  HexToClr
//
//  Created by Tomoya Hirano on 2016/11/21.
//
//

import Cocoa

private func main(arguments: [String]) {
  let arguments = arguments.dropFirst()
  guard let input = arguments.first else {
    print("Usage: HexToClr ./color.txt")
    return
  }
  let source = Utils.parsePath(input)
  if HexToClr.convert(source: source) {
    print("Done")
  } else {
    print("failed...")
  }
}

main(arguments: CommandLine.arguments)
