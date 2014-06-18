//
//  MTLShot.swift
//  DribbbleApp
//
//  Created by LLL on 14-6-18.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import Foundation

class MTLShot: MTLModel {
    
    var id:Int?
    var title:String?
    var descriptionOfShot:String?
    var url:String?
    var shortUrl:String?
    var imageUrl:String?
    var imageTeaserUrl:String?
    var width:Int?
    var height:Int?
    var likesCount:Int?
    
    func JSONKeyPathsByPropertyKey() -> NSDictionary {
        return [
            "id" : "id",
            "descriptionOfShot" : "description",
            "shortUrl" : "short_url",
            "imageUrl" : "image_url",
            "imageTeaserUrl" : "image_teaser_url",
            "likesCount" : "likes_count"
        ]
    }
    
    init()  {
        super.init()
    }
    

}
