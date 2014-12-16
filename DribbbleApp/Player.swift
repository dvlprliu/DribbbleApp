//
//  Player.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class Player: JsonParser {
  
  var id: Int = 0
  var name: String = ""
  var username: String = ""
  var url: String = ""
  var avatarUrl: String = ""
  var location: String = ""
  var twitterScreenName: String = ""
  var draftedByPlayerId: Int = 0
  var shotsCount: Int = 0
  var drafteesCount: Int = 0
  var followersCount: Int = 0
  var followingCount: Int = 0
  var commentsCount: Int = 0
  var commentsReceivedCount: Int = 0
  var likesCount: Int = 0
  var likeReceivedCount: Int = 0
  var reboundsCount: Int = 0
  var reboundsReceivedCount: Int = 0
  var createdAt: String = ""
  
  init() {
    
  }
  
  func parse(json: JSON) {
    
    id = json["id"].intValue
    name = json["name"].stringValue
    username = json["username"].stringValue
    url = json["url"].stringValue
    avatarUrl = json["avatar_url"].stringValue
    location = json["location"].stringValue
    twitterScreenName = json["twitter_screen_name"].stringValue
    draftedByPlayerId = json["drafted_by_player_id"].intValue
    shotsCount = json["shots_count"].intValue
    drafteesCount = json["draftees_count"].intValue
    followersCount = json["followers_count"].intValue
    followingCount = json["following_count"].intValue
    commentsCount = json["comments_count"].intValue
    commentsReceivedCount = json["comments_received_count"].intValue
    likesCount = json["likes_count"].intValue
    likeReceivedCount = json["likes_received_count"].intValue
    reboundsCount = json["rebounds_count"].intValue
    reboundsReceivedCount = json["rebounds_received_count"].intValue
    createdAt = json["created_at"].stringValue
    
  }
  
}
