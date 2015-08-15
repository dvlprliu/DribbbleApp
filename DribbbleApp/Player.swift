//
//  Player.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit
import SwiftyJSON

class User: JsonParser {
  
  var id: Int = 0
  var name: String = ""
  var username: String = ""
  var htmlUrl: String = ""
  var avatarUrl: String = ""
  var location: String = ""
  var links: [String: JSON] = [String: JSON]()
  var bucketsCount: Int = 0
  var bio: String = ""
  var twitterScreenName: String = ""
  var draftedByPlayerId: Int = 0
  var shotsCount: Int = 0
  var drafteesCount: Int = 0
  var followersCount: Int = 0
  var followingCount: Int = 0
  var commentsCount: Int = 0
  var projectCount: Int = 0
  var commentsReceivedCount: Int = 0
  var likesCount: Int = 0
  var likeReceivedCount: Int = 0
  var reboundsCount: Int = 0
  var reboundsReceivedCount: Int = 0
  var createdAt: String = ""
  
  var teamCount: Int = 0
  var type: String = ""
  var pro: Bool = false
  
  var bucketsURL: String = ""
  var followerURL: String = ""
  var followingURL: String = ""
  var likesURL: String = ""
  var projectsURL: String = ""
  var shotsURL: String = ""
  var teamsURL: String = ""
  var updatedAt: String = ""
  
  init() {
    
  }
  
  func parse(json: JSON) {
    
    teamCount = json["teams_count"].intValue
    type = json["type"].stringValue
    pro = json["pro"].boolValue
    
    bucketsURL = json["buckets_url"].stringValue
    followerURL = json["followers_url"].stringValue
    followingURL = json["followings_url"].stringValue
    likesURL = json["likes_url"].stringValue
    projectsURL = json["projects_url"].stringValue
    shotsURL = json["shots_url"].stringValue
    teamsURL = json["teams_url"].stringValue
    updatedAt = json["updated_at"].stringValue
    
    id = json["id"].intValue
    name = json["name"].stringValue
    username = json["username"].stringValue
    htmlUrl = json["html_url"].stringValue
    avatarUrl = json["avatar_url"].stringValue
    bio = json["bio"].stringValue
    links = json["links"].dictionaryValue
    location = json["location"].stringValue
    bucketsCount = json["buckets_count"].intValue
    projectCount = json["projects_count"].intValue
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
