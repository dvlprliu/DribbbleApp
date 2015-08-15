//
//  Team.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/18.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import Foundation
import SwiftyJSON

class Team: JsonParser {
  
  var id: Int = 0
  var name: String = ""
  var userName: String = ""
  var htmlURL: String = ""
  var avatarURL: String = ""
  var bio: String = ""
  var location: String = ""
  var links: [String: JSON] = [String: JSON]()

  var bucketsCount: Int = 0
  var followersCount: Int = 0
  var followingsCount: Int = 0
  var likesCount: Int = 0
  var projectsCount: Int = 0
  var shotsCount: Int = 0
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
    
    id = json["id"].intValue
    name = json["name"].stringValue
    userName = json["user_name"].stringValue
    htmlURL = json["html_url"].stringValue
    avatarURL = json["avatar_url"].stringValue
    bio = json["bio"].stringValue
    location = json["location"].stringValue
    links = json["links"].dictionaryValue
    
    bucketsCount = json["buckets_count"].intValue
    followersCount = json["follower_count"].intValue
    followingsCount = json["following_count"].intValue
    projectsCount = json["projects_count"].intValue
    shotsCount = json["shots_count"].intValue
  
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
  }
  
}