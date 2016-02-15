//
//  TimeLineViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/13/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var scrubber: UIImageView!
    @IBOutlet weak var navImage: UIImageView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var timeLineScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLineScrollView.contentSize = CGSize(width: 320, height: 1564+36+65)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.bannerView.alpha=1
            self.scrubber.alpha=1
            self.navImage.alpha=1
            self.feedImage.alpha=1
            self.image2.alpha=1
            self.image3.alpha=1
            self.imageButton.transform = CGAffineTransformIdentity
            self.bannerView.transform = CGAffineTransformMakeTranslation(0, 44)
        }
    }

    @IBAction func closeDidTap(sender: AnyObject) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.bannerView.transform = CGAffineTransformIdentity
        }
    }
    
    @IBAction func imageDidTap(sender: AnyObject) {
        UIView.animateWithDuration(0.4) { () -> Void in
            self.bannerView.alpha=0
            self.scrubber.alpha=0
            self.navImage.alpha=0
            self.feedImage.alpha=0
            self.image2.alpha=0
            self.image3.alpha=0
            self.imageButton.transform = CGAffineTransformMakeTranslation(107, 10)
            self.imageButton.transform = CGAffineTransformScale(self.imageButton.transform, 3, 3)
            
        }
        delay(0.4){
            self.performSegueWithIdentifier("slideShowSegue", sender: self)
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
