//
//  SlideshowViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/14/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class SlideshowViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var step1Text: UILabel!
    @IBOutlet weak var step2Text: UILabel!
    @IBOutlet weak var slidshowScrollView: UIScrollView!
    var defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        step1Text.alpha=0
        step2Text.alpha=0
        slidshowScrollView.delegate=self
        slidshowScrollView.contentSize = CGSize(width: 960, height: 568)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        if defaults.integerForKey("photoDidTap") == 1 {
            print("already saved")
        }
        else {
            self.defaults.setInteger(1,forKey: "photoDidTap")
            self.defaults.synchronize()
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.step1Text.alpha=1
            })
            delay(0.8){
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.step1Text.alpha=0
                })
            }
        }
    }
    @IBAction func closeDidTap(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func shareDidTap(sender: AnyObject) {
        self.defaults.setInteger(1,forKey: "shareDidTap")
        self.defaults.synchronize()
        let activityViewController = UIActivityViewController(activityItems:["Test 1", "Test 2"], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        if slidshowScrollView.contentOffset.x == 320 {
            if defaults.integerForKey("photoDidScroll") == 1 {
                print("already scrolled")
            }
            else {
                self.defaults.setInteger(1,forKey: "photoDidScroll")
                self.defaults.synchronize()
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.step2Text.alpha=1
                })
                delay(0.8){
                    UIView.animateWithDuration(0.4, animations: { () -> Void in
                        self.step2Text.alpha=0
                    })
                }
            }
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
