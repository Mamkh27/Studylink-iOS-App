//
//  Badge2ViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/5/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class Badge2ViewController: UIViewController {

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
                self.view.bringSubviewToFront(self.view2)
                self.view.bringSubviewToFront(self.nextbtn)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
