//
//  PlistExtractor.swift
//  PravoslavacDue
//
//  Created by Zeljko Bilbija on 15/12/17.
//  Copyright © 2017 Zeljko Bilbija. All rights reserved.
//

import Foundation

let datnasnjiDatum = Calendar(identifier: .gregorian)
let format = DateFormatter()








func arrayStringiFromPlistOfArrayOfDictionaries(plist: String, key: String, rangeLocation: Int, rangeLenght: Int) -> [String] {
    var arrayStringi = [String]()

    if let path = Bundle.main.path(forResource: plist, ofType: "plist") {
        if let array = NSArray(contentsOfFile: path) {
            let podArray = array.subarray(with: NSMakeRange(rangeLocation, rangeLenght)) as NSArray

            for _ in podArray {
                let str = podArray.value(forKey: key)

                arrayStringi = str as! [String]
            }
        }
    }
    return arrayStringi
}

func arrayStringiFromPlistOfArrayOfString(plist: String) -> [String] {
    var arrayStringi = [String]()

    if let path = Bundle.main.path(forResource: plist, ofType: "plist") {
        if let array = NSArray(contentsOfFile: path) {
            arrayStringi = array as! [String]
        }
    }

    return arrayStringi
}

func stringFromDictionaruOfStrings(plist: String, index: Int) -> String {
    var str = String()

    if let path = Bundle.main.path(forResource: plist, ofType: "plist") {
        if let array = NSDictionary(contentsOfFile: path) {
            // AKO ARAY POCINJE KASKO TREBNA; SA NULOM
            // str = array.value(forKey: "\(index)") as! String

            // AKO ARRAY NE POCINJE SA NULOM VEC SA BROJEM 1

            str = array.value(forKey: "\(index + 1)") as! String
        }
    }
    return str
}



func arrayStringiFromArrayaDictionaries(plistName: String) -> String {
  format.calendar = datnasnjiDatum
  format.dateFormat = "ddd"
  return ""
}
