//
//  DribbbleManager.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit
import Alamofire


class DribbbleManager: NSObject {
  
  let APIUrl = "http://api.dribbble.com"
  typealias Complation = (JSON!, NSError!) -> Void
  
  private var complation: Complation?
  
  enum ListType: String {
    case Popular = "popular"
    case Everyone = "everyone"
    case Debuts = "Debuts"
  }
  
  class func getShots(list: ListType, complation: Complation) {
    let manager = DribbbleManager()
    let requestString = "\(manager.APIUrl)/shots/\(list.rawValue)"
    manager.complation = complation
    manager.fetch(requestString)
  }
  
  
  func fetch(url:String) {
    let requestURL = NSURL(string: url)
    Alamofire.request(.GET, url).responseJSON { (req, resp, someJson, someError) -> Void in
      if let error = someError {
        self.complation?(nil, error)
        return
      }
      
      if let json: AnyObject = someJson {
        var json = JSON(json)
        self.complation?(json, nil)
        return
      }
    
    }
  }
   
}
