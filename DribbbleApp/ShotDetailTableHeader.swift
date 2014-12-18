//
//  ShotDetailTableHeader.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/17.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotDetailTableHeader: UIView {
  
  class func nibView() -> UIView? {
  
    return NSBundle.mainBundle().loadNibNamed("ShotDetailTableHeader", owner: nil, options: nil).first as? UIView
    
  }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
