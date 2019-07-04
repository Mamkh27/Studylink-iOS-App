//
//  LogInViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/1/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet var loginbtn: UIButton!
    @IBOutlet weak var loginBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
loginbtn.layer.cornerRadius = 5;
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)
        self.view.bringSubviewToFront(self.loginBox)
        // Do any additional setup after loading the view.
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
