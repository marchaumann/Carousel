//
//  IntroViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/11/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var introBackground: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize=introBackground.image!.size
        //introScrollView.delegate = self
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

