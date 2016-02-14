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
    let xInitials: [Float] = [48,269,254,166,50,144]
    let yInitials: [Float] = [469,497,391,497,380,396]
    let xOffsets: [Float] = [122,238,238,84,161,238]
    let yOffsets: [Float] = [789,752,828,906,906,906]
    let scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    let rotations : [Int] = [-10, -10, 10, 10, 10, -10]
    override func viewDidLoad() {
        super.viewDidLoad()
        let tileArray = [tile1,tile2,tile3,tile4,tile5,tile6]
        introScrollView.contentSize=introBackground.image!.size
        introScrollView.delegate = self
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
        let tileArray = [tile1,tile2,tile3,tile4,tile5,tile6]
        let scrollOffset=self.introScrollView.contentOffset.y
        for (index, tile) in EnumerateSequence(tileArray) {
            let scale = convertValue(scrollOffset, r1Min: -80, r1Max: 568, r2Min: CGFloat(scales[index]), r2Max: 1)
            let rotation = convertValue(scrollOffset, r1Min: -80, r1Max: 568, r2Min: CGFloat(rotations[index]), r2Max: 0)
            tile.transform = CGAffineTransformMakeScale(scale, scale)
            tile.transform = CGAffineTransformRotate(tile.transform,
                CGFloat(Double(rotation) * M_PI / 180))
            tile.center.y = convertValue(scrollOffset, r1Min: -80, r1Max: 568, r2Min: CGFloat(yInitials[index]), r2Max: CGFloat(yOffsets[index]))
            tile.center.x = convertValue(scrollOffset, r1Min: -80, r1Max: 568, r2Min: CGFloat(xInitials[index]), r2Max: CGFloat(xOffsets[index]))
        }
//        tile1.center.y = convertValue(scrollOffset, r1Min: 0, r1Max: 568, r2Min: 490, r2Max: CGFloat(yOffsets[0]))
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

