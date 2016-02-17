//
//  ViewController.swift
//  UIPageViewControllerSample
//
//  Created by jyoti sakhare on 17/02/16.
//  Copyright © 2016 jyoti sakhare. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    @IBOutlet weak var ContainerPageView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    

    var pageViewController: ContainerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func nextOnClick(sender: AnyObject) {
        self.pageViewController?.setViewControllers([self.randomVC()], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    @IBAction func previsionOnCLick(sender: UIButton) {
        self.pageViewController?.setViewControllers([self.randomVC()], direction: UIPageViewControllerNavigationDirection.Reverse, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ContainerViewController
            where segue.identifier == "pageViewController" {
                self.pageViewController = vc
                self.pageViewController?.delegate = self
                self.pageViewController?.dataSource = self
                self.view.gestureRecognizers = self.pageViewController?.gestureRecognizers
        }
    }
    
    func  randomVC() -> UIViewController {
        let vc = UIViewController()
        let i = (CGFloat)(random() % 255)
         let j = (CGFloat)(random() % 255)
         let k = (CGFloat)(random() % 255)
        let color = UIColor(red:i/255.0, green: j/255.0,blue:k/255.0,alpha:1)
        vc.view.backgroundColor = color
        return vc
    }
    
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            return randomVC()
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
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            return randomVC()
//            print("here");
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

