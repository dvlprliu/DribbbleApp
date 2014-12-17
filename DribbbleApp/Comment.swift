//
//  Comment.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/17.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import Foundation

class Comment: JsonParser {
  
  var id: Int = 0
  var body: String = ""
  var likesCount: Int = 0
  var createdAt: String = ""
  var player:Player = Player()
  
  func parse(json: JSON) {
    id = json["id"].intValue
    body = json["body"].stringValue
    likesCount = json["likes_count"].intValue
    createdAt = json["created_at"].stringValue
    player.parse(json["player"])
  }
  
}
