//
//  ShotDetailViewController.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotDetailViewController: UIViewController, UIScrollViewDelegate {
  
  private let AuthorCellIdentifer = "AuthorCell"
  private let AttetchmentCellIdentifer = "AttatchmentCell"
  private let TagCellIdentifer = "TagCell"
  private let LikeCellIdentifier = "LikeCell"
  
  var shot: Shot? = nil
  
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let headerView = ShotDetailTableHeader.nibView()
    
    tableView.setParallaxHeaderView(headerView, mode: VGParallaxHeaderMode.Fill, height: 200)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    tableView.shouldPositionParallaxHeader()
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

extension ShotDetailViewController: UITableViewDelegate, UITableViewDataSource {
  

  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 5
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section{
    case 0, 1, 2:
      return 1
    case 3:
      if let aShot = shot {
        println("attachment count \(aShot.attachmentsCount)")
        return aShot.attachmentsCount
      }
    case 4:
      if let aShot = shot {
        println("comment count \(aShot.commentsCount)")
        return aShot.commentsCount
      }
    default:
      return 0
    }
    
    return 0
  }
  
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let section = indexPath.section
    let row = indexPath.row
    if section == 0 {
      let cell = tableView.dequeueReusableCellWithIdentifier(LikeCellIdentifier) as ShotLikesTableCell
      
      cell.shot = shot
      
      return cell
    }
    else if section == 1 {
      let cell = tableView.dequeueReusableCellWithIdentifier(AuthorCellIdentifer) as ShotInfoTableCell
      
      cell.shot = shot
      
      return cell
    }
      
    else if section == 2 {
      let tagCell = tableView.dequeueReusableCellWithIdentifier(TagCellIdentifer) as UITableViewCell
      
      return tagCell
    }
      
    else if section == 3 {
      let attatchmentCell = tableView.dequeueReusableCellWithIdentifier(AttetchmentCellIdentifer) as UITableViewCell
      
      return attatchmentCell
    }
      
    else if section == 4 {
      let authCell = tableView.dequeueReusableCellWithIdentifier(AuthorCellIdentifer) as UITableViewCell
      
      return authCell
    }
      
    else {
      return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    }
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      return 86
    case 1:
      return 149
    case 2:
      return 44
    case 3:
      return 49
    case 4:
      return 120
    default:
      return 0
    }
  }
}

