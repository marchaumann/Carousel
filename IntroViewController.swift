//
//  IntroViewController.swift
//  Carousel
//
//  Created by Marc Haumann on 2/11/16.
//  Copyright © 2016 Marc Haumann. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    @IBOutlet weak var introBackground: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tileArray = [tile1,tile2,tile3,tile4,tile5,tile6]
        let xOffsets: [Float] = [46,200,200,46,123,200]
        let yOffsets: [Float] = [752,752,828,906,906]
        let scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
        let rotations : [Int] = [-10, -10, 10, 10, 10, -10]
        introScrollView.contentSize=introBackground.image!.size
        introScrollView.delegate = self
        tile1.frame.origin.x = -46
        tile1.frame.origin.y = 490
        for (index, tile) in EnumerateSequence(tileArray) {
            let scale=CGFloat(scales[index])
            tile.transform = CGAffineTransformMakeScale(scale, scale)
            tile.transform = CGAffineTransformRotate(tile.transform,
            CGFloat(Double(rotations[index]) * M_PI / 180))
        }
        //print(tileArray(0).image!.size, ",", tileArray(0).frame.origin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollOffset=self.introScrollView.contentOffset.y
        tile1.center.y = convertValue(scrollOffset, r1Min: 0, r1Max: 568, r2Min: 490, r2Max: 752)
//        tile1.frame.origin.x = convertValue(offset, r1Min: 0, r1Max: 46, r2Min: 0, r2Max: 1136)
        // This method is called as the user scrolls
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

