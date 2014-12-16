//
//  ShotDetailViewController.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotDetailViewController: UIViewController {
  
  
  var shot: Shot?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    println(shot)
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
