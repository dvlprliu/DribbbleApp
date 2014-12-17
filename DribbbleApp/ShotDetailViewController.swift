//
//  ShotDetailViewController.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class ShotDetailViewController: UIViewController {
  
  
  var shot: Shot? = nil
  
  private let AuthorCellIdentifer = "AuthorCell"
  private let AttetchmentCellIdentifer = "AttatchmentCell"
  private let TagCellIdentifer = "TagCell"
  
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableViewHeader  = NSBundle.mainBundle().loadNibNamed("ShotDetailTableHeader", owner: nil, options: nil).first as ShotDetailTableHeader
    tableView.tableHeaderView = tableViewHeader
    tableView.contentInset = UIEdgeInsets(top: 200-64, left: 0, bottom: 0, right: 0)
    tableView.contentOffset = CGPoint(x: 0, y: 64 - 200)
    view.bringSubviewToFront(headerView)
    println(shot)

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

extension ShotDetailViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 4
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section{
    case 0:
      return 1
    case 1:
      return 1
    case 2:
      return 3
    case 3:
      return 10
    default:
      return 0
    }
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      return 149
    case 1:
      return 44
    case 2:
      return 59
    case 3:
      return 149
    default:
      return 0
    }
 
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let section = indexPath.section
    let row = indexPath.row
    
    if section == 0 {
      let cell = tableView.dequeueReusableCellWithIdentifier(AuthorCellIdentifer) as UITableViewCell
      
      return cell
    }
    
    else if section == 1 {
      let tagCell = tableView.dequeueReusableCellWithIdentifier(TagCellIdentifer) as UITableViewCell
      
      return tagCell
    }
    
    else if section == 2 {
      let attatchmentCell = tableView.dequeueReusableCellWithIdentifier(AttetchmentCellIdentifer) as UITableViewCell
      
      return attatchmentCell
    }
    
    else if section == 3 {
      let authCell = tableView.dequeueReusableCellWithIdentifier(AuthorCellIdentifer) as UITableViewCell
      
      return authCell
    }
      
    else {
      return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    }
  }
}
