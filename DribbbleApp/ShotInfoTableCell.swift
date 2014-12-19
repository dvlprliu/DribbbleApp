//
//  ShotInfoTableCell.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/19.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotInfoTableCell: ShotCell, ShotCellConfigure {
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var userLabel: UILabel!
  @IBOutlet weak var describLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  override func configureCell(model: Shot) {
    userLabel.text = model.user.username
    describLabel.text = model.descriptionOfShot
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
