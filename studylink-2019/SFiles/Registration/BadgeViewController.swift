//
//  BadgeViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController {

    
 

    @IBOutlet var b27: UIButton!
    @IBOutlet var b26: UIButton!
    @IBOutlet var b25: UIButton!
    @IBOutlet var b24: UIButton!
    @IBOutlet var b23: UIButton!
    @IBOutlet var b22: UIButton!
    @IBOutlet var b21: UIButton!
    @IBOutlet var b20: UIButton!
    @IBOutlet var b19: UIButton!
    @IBOutlet var b18: UIButton!
    @IBOutlet var b17: UIButton!
    @IBOutlet var b16: UIButton!
    @IBOutlet var b15: UIButton!
    @IBOutlet var b14: UIButton!
    @IBOutlet var b13: UIButton!
    @IBOutlet var b12: UIButton!
    @IBOutlet var b11: UIButton!
    @IBOutlet var b10: UIButton!
    @IBOutlet var b9: UIButton!
    @IBOutlet var view3: UIView!
    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    @IBOutlet var b3: UIButton!
    @IBOutlet var b4: UIButton!
    @IBOutlet var b6: UIButton!
    @IBOutlet var b8: UIButton!
    @IBOutlet var b7: UIButton!
    @IBOutlet var b5: UIButton!
    @IBOutlet var nextbtn: UIButton!
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)
        

        self.view.bringSubviewToFront(self.view1)
        self.view.bringSubviewToFront(self.nextbtn)
        self.view.bringSubviewToFront(self.view2)
        self.view.bringSubviewToFront(self.b1)
        self.view.bringSubviewToFront(self.b2)
        self.view.bringSubviewToFront(self.b3)
        self.view.bringSubviewToFront(self.b4)
        self.view.bringSubviewToFront(self.b5)
        self.view.bringSubviewToFront(self.b6)
        self.view.bringSubviewToFront(self.b7)
        self.view.bringSubviewToFront(self.b8)
        self.view.bringSubviewToFront(self.b9)
        self.view.bringSubviewToFront(self.b10)
        self.view.bringSubviewToFront(self.b11)
        self.view.bringSubviewToFront(self.b12)
        self.view.bringSubviewToFront(self.b13)
        self.view.bringSubviewToFront(self.b14)
        self.view.bringSubviewToFront(self.b15)
        self.view.bringSubviewToFront(self.b16)
        self.view.bringSubviewToFront(self.b17)
        self.view.bringSubviewToFront(self.b18)
        self.view.bringSubviewToFront(self.b19)
        self.view.bringSubviewToFront(self.b20)
        self.view.bringSubviewToFront(self.b21)
        self.view.bringSubviewToFront(self.b22)
        self.view.bringSubviewToFront(self.b23)
        self.view.bringSubviewToFront(self.b24)
        self.view.bringSubviewToFront(self.b25)
        self.view.bringSubviewToFront(self.b26)
        self.view.bringSubviewToFront(self.b27)
        self.view.bringSubviewToFront(self.view3)
        
    }
    



}
