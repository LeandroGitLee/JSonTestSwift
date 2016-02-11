//
//  JSONLoader.swift
//  JSonTesteSwift
//
//  Created by LeandroLee on 2/10/16.
//  Copyright © 2016 goldhandsapp4u. All rights reserved.
//

import Foundation

class JSONLoader {
    
    class func load(caminho: String, onCompleteFunction: ((NSData?) -> Void), onErrorFunction: ((NSError?) -> Void)) {
        let url: NSURL = NSURL(string: caminho)!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        let session:NSURLSession = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if (error != nil) {
                onErrorFunction(error)
            } else {
                onCompleteFunction(data)
            }
        }
        task.resume()
    }
    
}