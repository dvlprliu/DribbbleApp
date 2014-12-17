//
//  ShotCell.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotCell: UITableViewCell {
  
  @IBOutlet weak var shotImageView: UIImageView!
  @IBOutlet weak var loader: UIActivityIndicatorView!
  
  var shot:Shot? {
    didSet {
      
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    loader.startAnimating()
    self.addObserver(self, forKeyPath: "self.shotImageView.image", options: NSKeyValueObservingOptions.New, context: nil)
  }
  
  override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
    if keyPath == "self.shotImageView.image" {
      if let image = change["new"] as? UIImage {
        loader.stopAnimating()
      }
      
    }
  }
  
  deinit {
    println("\(__FUNCTION__)")
    self.removeObserver(self, forKeyPath: "self.shotImageView.image")
  }
}
