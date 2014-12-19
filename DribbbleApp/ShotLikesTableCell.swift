//
//  ShotLikesTableCell.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/19.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotLikesTableCell: ShotCell, ShotCellConfigure {
  
  @IBOutlet weak var likesCountLabel: UILabel!
  @IBOutlet weak var commentsCountLabel: UILabel!
  @IBOutlet weak var viewsCountLabel: UILabel!
  
  @IBAction func viewLikes(sender: AnyObject) {
    
  }
  @IBAction func viewComments(sender: AnyObject) {
    
  }
  
  override func configureCell(model: Shot) {
    println("configure cell \(self)， \(model)")
    
    likesCountLabel.text = "\(model.likesCount)"
    commentsCountLabel.text = "\(model.commentsCount)"
    viewsCountLabel.text = "\(model.viewsCount)"
    
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
