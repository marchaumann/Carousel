//
//  LoginViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/11/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var signInScrollView: UIScrollView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    //var initialFieldY: CGFloat!
    var initialButtonY: CGFloat!
    var offset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initialFieldY=fieldParentView.frame.origin.y
        initialButtonY = buttonParentView.frame.origin.y
        spinnerView.hidden=true
        signInScrollView.contentSize=signInScrollView.frame.size
        signInScrollView.contentInset.bottom=130
        signInScrollView.delegate=self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backDidTap(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification:NSNotification!){
        let offset = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        buttonParentView.frame.origin.y = initialButtonY - offset.height/2
        signInScrollView.contentOffset.y = signInScrollView.contentInset.bottom
        //fieldParentView.frame.origin.y = initialFieldY - offset.height/2
    }

    func keyboardWillHide(notification:NSNotification!){
        buttonParentView.frame.origin.y = initialButtonY
        //fieldParentView.frame.origin.y = initialFieldY
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if signInScrollView.contentOffset.y <= -50 {
            view.endEditing(true)
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