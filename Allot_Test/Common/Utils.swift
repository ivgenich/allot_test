//
//  Utils.swift
//  Allot_Test
//
//  Created by Chertok on 01/05/2020.
//  Copyright © 2020 IT DEV. All rights reserved.
//

import Foundation

class Utils {
    
    class func getAuthToken() -> String{
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
            guard let token = nsDictionary?["Auth Token"] else {
                return ""
            }
            return token as! String
        }
        return ""
    }
    
    class func convertDateFormat(inputDate: String) -> String {
        
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: inputDate)!
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        dateFormatter.locale = tempLocale
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}


