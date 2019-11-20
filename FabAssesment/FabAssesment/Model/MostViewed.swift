//
//  MostViewed.swift
//  FabAssesment
//
//  Created by Madhusudhan on 19/11/19.
//  Copyright © 2019 BankFab. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

/**
 The purpose of the `MostViewed` is to save News information in parameters
 
 The `MostViewed` class is a subclass of the `NSObject`,
 */

class MostViewed: NSObject {
    
    /// String object that holds News ID
    var newsID: String?
    
    /// String object that holds News Title
    var newsTitle: String?
    
    /// String object that holds News Written By Name
    var newsByName: String?
    
    /// String object that holds News Published Date
    var newsPublished: String?
    
    /// String object that holds News Description
    var newsDescription: String?

    var mediaArray = [Media]()
    
    /** Getting data from dictionary and storing in each object with help of Dictionary key's
     
     - Parameter dict: News Info With keys and values
     */
    init(dict: [String : Any]) {
        
        super.init()
        
        newsID = String.checkNSNumberNull((dict["id"] as Any))
        newsTitle = String.checkNullValue((dict["title"] as Any))
        newsByName = String.checkNullValue((dict["byline"] as Any))
        newsPublished = String.checkNullValue((dict["published_date"] as Any))
        newsDescription = String.checkNullValue((dict["abstract"] as Any))
        
        mediaArray.removeAll()

        var mediaDataArray = String.checkArray((dict["media"] as Any))
        
        if mediaDataArray.count != 0 {
            let dict = String.checkDictionary(mediaDataArray[0] as Any)
            mediaDataArray = String.checkArray(dict["media-metadata"] as Any)
        }
        
        // insert each item into database
        for i in 0..<mediaDataArray.count {
            let mediaObj = Media(dict: mediaDataArray.object(at: i) as! [String : Any])
            self.mediaArray.append(mediaObj)
        }
        
    }
    
}

class Media: NSObject {
    
    /// String object that holds Media url LInk
    var imageurl: String?
    
    /** Getting data from dictionary and storing in each object with help of Dictionary key's
     
     - Parameter dict: News Info With keys and values
     */
    init(dict: [String : Any]) {
        
        super.init()
        
        imageurl = String.checkNullValue((dict["url"] as Any))
        
    }
    
}



