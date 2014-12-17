//
//  TransitionManager.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/17.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import UIKit

class TransitionManager: NSObject {
  private var presenting = false
}

extension TransitionManager: UIViewControllerAnimatedTransitioning {
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
    return 0.25
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
    let container = transitionContext.containerView()
    
    let screens: (from: UIViewController, to: UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
    
    container.addSubview(screens.to.view)
    screens.to.view.alpha = 0
    
    let duration = self.transitionDuration(transitionContext)
    
    UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
      screens.to.view.alpha = 1
    }) { (finished) -> Void in
      
      transitionContext.completeTransition(true)
      
    }
  }
}

extension TransitionManager: UIViewControllerTransitioningDelegate {
  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    self.presenting = true
    return self
  }
  
  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    self.presenting = false
    return self
  }
}
