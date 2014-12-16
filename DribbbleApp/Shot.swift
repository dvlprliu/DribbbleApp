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
  var imageTeaserUrl:String = ""
  var width:Int = 0
  var height:Int = 0
  var likesCount:Int = 0
  var viewsCount:Int = 0
  var commentsCount: Int = 0
  var reboundsCounts: Int = 0
  var reboundsSourceId: Int = 0
  var createdAt:String = ""
  
  var image:UIImage?
  
  lazy var player: Player = Player()
  
  init() {
    
  }
  
  
  func parse(json: JSON){
    self.id = json["id"].intValue
    self.title = json["title"].stringValue
    self.descriptionOfShot = json["description"].stringValue
    self.url = json["url"].stringValue
    self.shortUrl = json["shot_url"].stringValue
    self.imageUrl = json["image_url"].stringValue
    self.imageTeaserUrl = json["image_teaser_url"].stringValue
    self.width = json["width"].intValue
    self.height = json["height"].intValue
    self.viewsCount = json["views_count"].intValue
    self.likesCount = json["likes_count"].intValue
    self.commentsCount = json["comments_count"].intValue
    self.reboundsCounts = json["rebounds_count"].intValue
    self.reboundsSourceId = json["rebounds_source_id"].intValue
    self.createdAt = json["created_at"].stringValue
    self.player = Player()
    self.player.parse(json["player"])
    
  }
  
}