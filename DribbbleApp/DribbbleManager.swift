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
  
  let ClientID = "27549b70c4cceebd4c222df9e98ce8ec74685382951ace45c968fbc589d0c177"
  let ClientSecret = "a22e5da1ea4ccb66dbafafd461b849939be983ebefad75acb8ea2f98aa0e1874"
  let AccessToken = "d7db2c99ce0e597d79a91b3709b066a73348bc82704105426965bb40fedc1f6b"
  
  let APIUrl = "https://api.dribbble.com/v1"
  
  typealias Complation = (JSON!, NSError!) -> Void
  
  private var complation: Complation?
  
  enum ListType: String {
    case Animated = "animated"
    case Attachments = "attachments"
    case Debuts = "debuts"
    case Playoffs = "playoffs"
    case Rebounds = "rebounds"
    case Teams = "teams"
  }
  
  class func getShots(list: ListType, complation: Complation) {
    let manager = DribbbleManager()
    let requestString = "\(manager.APIUrl)/shots?list=\(list.rawValue)&access_token=\(manager.AccessToken)"
    manager.complation = complation
    manager.fetch(requestString)
  }
  
  class func getCommentOfShot(shot: Shot, complatin: Complation) {
    let manager = DribbbleManager()
    let requestString = "\(manager.APIUrl)/shots?\(shot.id)"
    manager.complation = complatin
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
