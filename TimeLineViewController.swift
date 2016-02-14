//
//  TimeLineViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/13/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
