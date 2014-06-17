//
//  EMShotDetailViewController.swift
//  DribbbleApp
//
//  Created by LLL on 14-6-16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class EMShotDetailViewController: BaseViewController, UIWebViewDelegate {

    let shot:Shot?
    
    var webView:UIWebView?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    init(shot:Shot) {
        super.init(nibName:nil, bundle:nil)
        self.shot = shot
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = shot!.title
        setupWebView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavigationBar() {
        self.navigationController.navigationBar
    }
    
    func setupWebView() {
        
        var request = NSURLRequest(URL: NSURL(string:shot!.url))
        
        webView = UIWebView(frame: CGRectMake(0,0,CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)))
        webView!.loadRequest(request)
        webView!.delegate = self
        self.view.addSubview(webView)
    }
    
    func webViewDidStartLoad(webView: UIWebView!) {
//        SVProgressHUD.showWithStatus("Loading...",maskType:SVProgressHUDMaskTypeBlack)
    }
    func webViewDidFinishLoad(webView: UIWebView!) {
//        SVProgressHUD.dismiss()
    }
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
//        SVProgressHUD.dismiss()
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
