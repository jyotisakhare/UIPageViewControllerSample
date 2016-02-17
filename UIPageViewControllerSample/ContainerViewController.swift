//
//  ContainerViewController.swift
//  UIPageViewControllerSample
//
//  Created by jyoti sakhare on 17/02/16.
//  Copyright © 2016 jyoti sakhare. All rights reserved.
//

import Foundation
import UIKit

class ContainerViewController: UIPageViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //dataSource = self

        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                direction: .Forward,
                animated: true,
                completion: nil)
        }
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController("Green"),
            self.newColoredViewController("Red"),
            self.newColoredViewController("Blue")]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("\(color)ViewController")
    }
}

//extension ContainerViewController: UIPageViewControllerDataSource{
//    
//    func pageViewController(pageViewController: UIPageViewController,
//        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
//            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
//                return nil
//            }
//            
//            let previousIndex = viewControllerIndex - 1
//            
//            guard previousIndex >= 0 else {
//                return nil
//            }
//            
//            guard orderedViewControllers.count > previousIndex else {
//                return nil
//            }
//            
//            return orderedViewControllers[previousIndex]
//    }
//    
//    func pageViewController(pageViewController: UIPageViewController,
//        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
//            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
//                return nil
//            }
//            
//            let nextIndex = viewControllerIndex + 1
//            let orderedViewControllersCount = orderedViewControllers.count
//            
//            guard orderedViewControllersCount != nextIndex else {
//                return nil
//            }
//            
//            guard orderedViewControllersCount > nextIndex else {
//                return nil
//            }
//            
//            return orderedViewControllers[nextIndex]
//    }
//}