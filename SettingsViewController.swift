//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/13/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var settingsView: UIImageView!
    @IBOutlet weak var settingsScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScrollView.contentSize = settingsView.image!.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDidTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func singOutDidTap(sender: AnyObject) {
        let alertController = UIAlertController(title:"Are you sure you want to sign out?", message: "", preferredStyle: .ActionSheet)
        let OKAction = UIAlertAction(title: "Sign out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("backToIntroSegue", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {(action) in
        }
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
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
