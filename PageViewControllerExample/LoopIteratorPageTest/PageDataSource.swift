//
//  PageDataSource.swift
//  LoopIteratorPageTest
//
//  Created by Korey Hinton on 3/23/15.
//  Copyright (c) 2015 koreyhinton.com. All rights reserved.
//

import UIKit

class PageDataSource: NSObject, UIPageViewControllerDataSource {
    
    private var pageIterator = ArrayIterator<UIViewController>()
    private var pageViewController: UIPageViewController
    
    init(pageViewController pvc: UIPageViewController) {
        
        pageViewController = pvc
        
        var redController = UIViewController()
        redController.view.backgroundColor = UIColor.redColor()
        var yellowController = UIViewController()
        yellowController.view.backgroundColor = UIColor.yellowColor()
        var greenController = UIViewController()
        greenController.view.backgroundColor = UIColor.greenColor()
        
        pageIterator.loops = true
        pageIterator.array.append(redController)
        pageIterator.array.append(yellowController)
        pageIterator.array.append(greenController)
        
        self.pageViewController.setViewControllers([pageIterator.current()!], direction: .Forward, animated: false, completion: nil)
        
        super.init()
        pageViewController.dataSource = self
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return pageIterator.previous()
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return pageIterator.next()
    }
}