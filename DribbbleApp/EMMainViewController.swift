//
//  EMMainViewController.swift
//  DribbbleApp
//
//  Created by LLL on 14-6-15.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class EMMainViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    var _collectionView:UICollectionView!
    var _data = Array<Shot>()
    var imagesUrl = Array<String>()
    var downloadQueue:NSOperationQueue
    
    var currentPage = 0
    var totalPate = 0
    var shotsPerPage = 0
    var totalShots = 0
    var currentOffset = 0.0

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        downloadQueue = NSOperationQueue()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        // Custom initialization
    }
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "popular"
        
        getData();
        setupCollectionView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func getData() {
        
        SVProgressHUD.showWithStatus("Loading...",maskType:SVProgressHUDMaskTypeBlack);
        
        var httpManager = AFHTTPRequestOperationManager()
        var url = "http://api.dribbble.com/shots/popular"
        
        httpManager.GET(url, parameters:nil,
            success:{(responseOperation: AFHTTPRequestOperation!, responseData:AnyObject!)  in
            
                SVProgressHUD.dismiss()

                var dict = responseData as NSDictionary!
                
                var datas = dict["shots"] as NSArray!
                var shots = Array<Shot>()
                for var i = 0;  i < datas.count; i++ {
                    var shotDict = datas[i] as NSDictionary!
                    if let shot = self.parseData(shotDict) as? Shot {
                        shots.append(shot)
                    }
                }
                
                self._data = shots
                self._collectionView.reloadData()
                
                self.imagesUrl = self._data.map{ (shot:Shot) -> String in return shot.imageUrl! }
            
            },
            failure:{(operation:AFHTTPRequestOperation!, error: NSError!) in
                
            })
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.minimumInteritemSpacing = 5.0
        
        _collectionView = UICollectionView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)), collectionViewLayout:flowLayout)
        _collectionView.backgroundColor = UIColor.clearColor()
        _collectionView.delegate = self
        _collectionView.dataSource = self
        _collectionView.registerClass(ShotCell.self, forCellWithReuseIdentifier:"Cell")
        self.view.addSubview(_collectionView)
        
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return _data.count
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath:indexPath) as ShotCell
        
        var shot = _data[indexPath.item]
        cell.label!.text = shot.title
        cell.imageView!.image = shot.image
        
        if !collectionView.dragging && !collectionView.decelerating {
            downloadImageForIndexPath(indexPath)
        }

        return cell
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
        
        var shot = _data[indexPath.item]
        var originSize = CGSize(width:shot.width!, height:shot.height!)
        return scale(originSize)
        
    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        var shot = _data[indexPath.item]
        var shotDetailVC = EMShotDetailViewController(shot:shot)
        self.navigationController.pushViewController(shotDetailVC, animated: true)
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {

        var indexPaths = (self._collectionView.visibleCells() as? Array<ShotCell>)!
            .filter{ return ($0 as ShotCell).imageView?.image == nil}
            .map{(shotCell:ShotCell) -> NSIndexPath in return self._collectionView.indexPathForCell(shotCell)}
        
        for indexPath in indexPaths {
            downloadImageForIndexPath(indexPath)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        currentOffset = scrollView.contentOffset.y - CGRectGetHeight(self.view.frame)
        if currentOffset > -100 {
            
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!, willDecelerate decelerate: Bool) {
        println(currentOffset)
        if currentOffset > -90 {
            println("加载更多数据")
        }
    }
    
    func downloadImageForCells(cells:Array<ShotCell>) {
        
        for cell in cells {
            var indexPath = _collectionView.indexPathForCell(cell)
        }
    }
    
    func downloadImageForIndexPath(indexPath:NSIndexPath) {

        var shot = _data[indexPath.item]
        var url = NSURL.URLWithString(shot.imageUrl!)
        var request = NSURLRequest(URL: url)
        
        downloadQueue.addOperationWithBlock {
            NSURLConnection.sendAsynchronousRequest(request, queue:NSOperationQueue.mainQueue(), completionHandler:{(response:NSURLResponse!, data:NSData!, error: NSError!) -> Void in
                
                if error != nil {
                    println(error)
                    return;
                }
                var image = UIImage(data:data)
                var shot = self._data[indexPath.item]
                shot.image = image
                var cell:ShotCell? = self._collectionView.cellForItemAtIndexPath(indexPath) as? ShotCell
                
                if let aCell = cell {
                    aCell.imageView!.image = shot.image

                }
                
                })
            }
    }
    
    func scale(originSize:CGSize) -> CGSize {
        var baseWidth:Double = 150.0;
        var retaio:Double = baseWidth / originSize.width
        var height = originSize.height * retaio
        
        return CGSize(width:150, height:height)
    }
    
    
    
    
    func parseData(dict: NSDictionary) -> AnyObject {
        
        var shot = Shot()
        
        shot.id = dict["id"] as? Int
        shot.title = dict["title"] as? String
        shot.descriptionOfShot = dict["description"] as? String
        shot.url = dict["url"] as? String
        shot.shortUrl = dict["short_url"] as? String
        shot.imageUrl = dict["image_url"] as? String
        shot.imageTeaserUrl = dict["image_teaser_url"] as? String
        shot.width = dict["width"] as? Int
        shot.height = dict["height"] as? Int
        shot.likesCount = dict["likes_count"] as? Int
        shot.commentCount = dict["comments_count"] as? Int
        
        return shot
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
