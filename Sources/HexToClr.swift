import AppKit

class HexToClr {
  static func convert(source: (fromPath: String, toPath: String, name: String)) -> Bool {
    return convert(fromPath: source.fromPath, toPath: source.toPath, name: source.name)
  }
  
  static func convert(fromPath: String, toPath: String, name: String) -> Bool {
    guard let lines = Utils.readFile(with: fromPath) else { return false }
    let colors = Utils.convertColors(lines)
    let colorList = NSColorList(name: name)
    colors.forEach { colorList.setColor($0.value, forKey: $0.key) }
    return colorList.write(toFile: toPath)
  }
}
