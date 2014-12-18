//
//  EMShotModel.swift
//  DribbbleApp
//
//  Created by LLL on 14-6-15.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import Foundation
import UIKit

class Shot: JsonParser {
  
  var id:Int = 0
  var title:String = ""
  var descriptionOfShot:String = ""
  var url:String = ""
  var shortUrl:String = ""
  var imageUrl:String = ""
  var width:Int = 0
  var height:Int = 0
  var likesCount:Int = 0
  var viewsCount:Int = 0
  var commentsCount: Int = 0
  var reboundsCounts: Int = 0
  var reboundsSourceId: Int = 0
  var createdAt:String = ""
  
  var attachmentsCount: Int = 0
  var bucketsCount: Int = 0
  var updatedAt: String = ""
  var htmlURL: String = ""
  var attachmentsURL: String = ""
  var bucketsURL: String = ""
  var commentsURL: String = ""
  var likesURL: String = ""
  var projectsURL: String = ""
  var reboundsURL: String = ""
  var tags: [JSON] = [JSON]()
  var team: Team? = nil
  
  
  var hidpiImageURL: String = ""
  var normalImageURL: String = ""
  var teaserImageURL: String = ""
  
  var image:UIImage?
  
  lazy var user: User = User()
  
  init() {
    
  }
  
  func parse(json: JSON){
    
    self.id = json["id"].intValue
    self.title = json["title"].stringValue
    self.descriptionOfShot = json["description"].stringValue
    self.url = json["url"].stringValue
    self.shortUrl = json["shot_url"].stringValue
    self.imageUrl = json["image_url"].stringValue
    self.width = json["width"].intValue
    self.height = json["height"].intValue
    self.viewsCount = json["views_count"].intValue
    self.likesCount = json["likes_count"].intValue
    self.commentsCount = json["comments_count"].intValue
    self.reboundsCounts = json["rebounds_count"].intValue
    self.reboundsSourceId = json["rebounds_source_id"].intValue
    self.createdAt = json["created_at"].stringValue
    self.user.parse(json["user"])
    
    self.attachmentsCount = json["attachment_count"].intValue
    self.bucketsCount = json["buckets_count"].intValue
    self.updatedAt = json["updated_at"].stringValue
    self.htmlURL = json["html_url"].stringValue
    self.attachmentsURL = json["attachments_url"].stringValue
    self.bucketsURL = json["buckets_url"].stringValue
    self.commentsURL = json["comments_url"].stringValue
    self.likesURL = json["likes_url"].stringValue
    self.projectsURL = json["projects_url"].stringValue
    self.reboundsURL = json["rebounds_url"].stringValue
    self.tags = json["tags"].arrayValue
    
    self.hidpiImageURL = json["images","hidpi"].stringValue
    self.normalImageURL = json["images","normal"].stringValue
    self.teaserImageURL = json["images","teaser"].stringValue
    
  }
  
}