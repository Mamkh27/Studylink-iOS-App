//
//  WelcomePt2ViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/3/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class WelcomePt2ViewController: UIViewController {

    @IBOutlet var hourimg: UIImageView!
    @IBOutlet var nextbtn: UIButton!
    @IBOutlet var almostbtn: UIImageView!
    @IBOutlet var plsbtn: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
  

self.view.bringSubviewToFront(self.almostbtn)
self.view.bringSubviewToFront(self.plsbtn)
self.view.bringSubviewToFront(self.nextbtn)
self.view.bringSubviewToFront(self.hourimg)
        
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
