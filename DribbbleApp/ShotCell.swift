//
//  ShotCell.swift
//  DribbbleApp
//
//  Created by LLL on 14-6-15.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotCell: UICollectionViewCell {
    
    var label:UILabel?
    var imageView:UIImageView?

    init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.layer.cornerRadius = 2.0
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor
        self.layer.shadowOffset = CGSize(width:1, height:1)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 0.3
        self.backgroundColor = UIColor.whiteColor()
        
        label = UILabel(frame: CGRectMake(3,CGRectGetHeight(frame) - 20,CGRectGetWidth(frame) - 6, 20))
        label!.backgroundColor = UIColor.clearColor()
        label!.font = UIFont.systemFontOfSize(13.0)
        self.addSubview(label)
        
        imageView = UIImageView(frame:CGRectMake(3,3,CGRectGetWidth(frame) - 6, CGRectGetHeight(frame) - 6 - 20))
        imageView!.backgroundColor = UIColor.redColor()
        imageView!.contentMode = UIViewContentMode.ScaleAspectFill
        imageView!.clipsToBounds = true
        self.addSubview(imageView)
    }
}
