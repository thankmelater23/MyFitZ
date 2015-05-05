//: Playground - noun: a place where people can play

import UIKit

class MyClass: NSObject, NSCoding, Printable{
  let name: String
  init(name: String){
    self.name = name
  }

  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: "NAME")
  }

  required init(coder decoder:NSCoder){
    self.name = decoder.decodeObjectForKey("NAME") as! String
  }

  override var description: String{
    return "MyClassInstance.name = \(name)"
  }
}


let a = [MyClass(name: "Daddy"), [MyClass(name: "MyBitch")]]

let doa = ["x": a]
let dodoa = ["A": doa]
let nest = [dodoa]

println(nest[0]["A"]!["x"]![0])


let tempDirectory = NSTemporaryDirectory()
let temporaryFile = tempDirectory.stringByAppendingPathComponent("Encode-Tut.archive")
NSKeyedArchiver.archiveRootObject(nest, toFile: temporaryFile)

let nest2 = NSKeyedUnarchiver.unarchiveObjectWithFile(temporaryFile) as! [[String: [String: [MyClass]]]]
println(nest2[0]["A"]!["x"]![0])
