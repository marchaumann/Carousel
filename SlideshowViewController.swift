//
//  SlideshowViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/14/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class SlideshowViewController: UIViewController {

    @IBOutlet weak var slidshowScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        slidshowScrollView.contentSize = CGSize(width: 960, height: 568)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDidTap(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func shareDidTap(sender: AnyObject) {
        let activityViewController = UIActivityViewController(activityItems:["Test 1", "Test 2"], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
        self.presentViewController(activityViewController, animated: true, completion: nil)
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
