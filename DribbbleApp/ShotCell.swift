//
//  ShotCell.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/19.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotCell: UITableViewCell, ShotCellConfigure {
  
  var shot: Shot? {
    didSet {
      configureCell(shot!)
    }
  }
  
  func configureCell(model: Shot) {
    
  }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
