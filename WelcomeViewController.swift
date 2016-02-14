//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/12/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var endCarouselView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        endCarouselView.alpha=0
        welcomeScrollView.contentSize=CGSize(width: 1280, height: 568)
        welcomeScrollView.delegate=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(welcomeScrollView.contentOffset.x / 320))
        if page == 3 {
            UIView.animateWithDuration(1) { () -> Void in
                self.endCarouselView.alpha=1
            }
        }
        else {
            UIView.animateWithDuration(0.3) { () -> Void in
                self.endCarouselView.alpha=0
            }
        }
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = welcomeScrollView.contentOffset.x
        if offset > 640 {
            pageControl.alpha = convertValue(offset, r1Min: 640, r1Max: 960, r2Min: 1, r2Max: 0)
        }
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
