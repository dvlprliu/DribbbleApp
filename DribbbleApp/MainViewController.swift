//
//  MainViewController.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/15.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
  
  let cellIdentifer = "ShotCell"
  
  var refreshControl: UIRefreshControl!
  
  @IBOutlet weak var tableView: UITableView!
  var shots: [Shot] = [Shot]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setRefreshControl()
    
    loadShots()
    
    
  }
  
  // MARK: - UI
  
  func setRefreshControl() {
    self.refreshControl = UIRefreshControl(frame: CGRectZero)
    refreshControl.addTarget(self, action: "reloadShots:", forControlEvents: UIControlEvents.ValueChanged)
    tableView.addSubview(refreshControl)
  }
  
  // MARK: - Loading data
  
  private func loadShots() {
    DribbbleManager.getShots(DribbbleManager.ListType.Popular, complation: { (JSON, someError) -> Void in
      self.refreshControl.endRefreshing()
      if let error = someError {
        println("error : \(error)")
        return
      }
      
      if let json = JSON {
        
        var shots = [Shot]()
        for shotJson in json["shots"].arrayValue {
          var shot = Shot()
          shot.parse(shotJson)
          shots.append(shot)
        }
        self.shots = shots
      }
    })
  }
  
  func reloadShots(sender: AnyObject!) {
    refreshControl.beginRefreshing()
    loadShots()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "ShowShotDetail" {

    }
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shots.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer) as ShotCell
    let shot = shots[indexPath.row]
    let imageUrl = shot.imageUrl
    cell.shot = shot
    cell.shotImageView.sd_setImageWithURL(NSURL(string: imageUrl))
    
    
    return cell
  }
}