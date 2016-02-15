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
    @IBOutlet weak var buttonSwatch: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    //var initialFieldY: CGFloat!
    var initialButtonY: CGFloat!
    var offset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initialFieldY=fieldParentView.frame.origin.y
        buttonSwatch.alpha=0
        initialButtonY = buttonParentView.frame.origin.y
        spinnerView.hidden=true
        signInScrollView.contentSize=signInScrollView.frame.size
        signInScrollView.contentInset.bottom=130
        signInScrollView.delegate=self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        buttonParentView.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        buttonParentView.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 4, options: [], animations: {
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.buttonParentView.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.buttonParentView.alpha = 1
            }, completion: {(action) in})
//        UIView.animateWithDuration(0.3) { () -> Void in
//            // Return the views transform properties to their default states.
//            self.fieldParentView.transform = CGAffineTransformIdentity
//            self.buttonParentView.transform = CGAffineTransformIdentity
//            // Set the alpha properties of the views to fully opaque
//            self.fieldParentView.alpha = 1
//            self.buttonParentView.alpha = 1
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backDidTap(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func signInDidTap(sender: AnyObject) {
        if self.emailField.text!.isEmpty || self.passwordField.text!.isEmpty {
            let alertController = UIAlertController(title:"Email and password required",message: "Gotta fill out all the things, girl",preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
        else {
            self.spinnerView.hidden=false
            delay(1) {
                if self.emailField.text=="March" && self.passwordField.text=="pass" {
                    self.view.endEditing(true)
                    UIView.animateWithDuration(0.3) { () -> Void in
                        self.spinnerView.transform = CGAffineTransformMakeTranslation(-110,0)
                        self.buttonSwatch.alpha = 1
                    }
                    self.delay(1.5){
                        self.performSegueWithIdentifier("loginSegue",sender: self)
                    }
                }
                else {
                    self.spinnerView.hidden=true
                    let alertController = UIAlertController(title:"Invalid email or password",message: "You typed something wrong, bro",preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        // handle response here.
                    }
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                    
                }
            }
        }
        
        
    }
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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