//
//  ConversationsViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/13/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backDidTap(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
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
