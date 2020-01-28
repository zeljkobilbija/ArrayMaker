//
//  ViewController.swift
//  ArrayMaker
//
//  Created by Zeljko Bilbija on 27/01/2020.
//  Copyright © 2020 Zeljko Bilbija. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var svetitelji: [String] = []
    
    var spisak: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        svetitelji = arrayStringiFromPlistOfArrayOfDictionaries(plist: "PrestupnaGodina", key: "zitije", rangeLocation: 0, rangeLenght: 366)
        var text: String = ""
     
        for item in svetitelji {
            let str = "<item>\(item)</item>\n"
            text.append(str)
            
         
        }
        
        
//        napisiFajl(textZaStampu: text)
      
        drzgada(textZaStampu: text)
        
        
    }

    func napisiFajl(textZaStampu: String) {
        let spisakString = "tekst, stringa koja se upisuje u fajl"
        
        let fileName = "Alibaba"
        let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("xml")
        
        do{
            try spisakString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        }catch let error as NSError {
            print("Failed to write to URL")
            print(error)
        }
    }
    
    
    func drzgada(textZaStampu: String) {
          let fileName = "myFileName.xml"
        var filePath = ""
        
        // Fine documents directory on device
        let dirs:[String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        if dirs.count > 0 {
            let dir = dirs[0] //documents directory
            filePath = dir.appending("/" + fileName)
            print("Local path = \(filePath)")
        } else {
            print("Could not find local directory to store file")
            return
        }
        
        // Set the contents
        let fileContentToWrite = "Text to be recorded into file"
        
        do {
            // Write contents to file
            try textZaStampu.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print("An error took place: \(error)")
        }
    }
    

}

