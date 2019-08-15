//
//  PageFourViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/11/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class PageFourViewController: UIViewController {

    @IBOutlet var q5: UIImageView!
    @IBOutlet var q6: UIImageView!
    @IBOutlet var q7: UIImageView!
    
    
    @IBOutlet var q5op1: UIButton!
    @IBOutlet var q5op2: UIButton!
    @IBOutlet var q5op3: UIButton!
    @IBOutlet var q6op1: UIButton!
    @IBOutlet var q6op2: UIButton!
    @IBOutlet var q6op3: UIButton!
    @IBOutlet var q7op1: UIButton!
    @IBOutlet var q7op2: UIButton!
    @IBOutlet var q7op3: UIButton!
    

    @IBOutlet var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

self.q5.alpha = 0
self.q6.alpha = 0
self.q7.alpha = 0
self.nextBtn.alpha = 0
    
self.q5op1.alpha = 0
self.q5op2.alpha = 0
self.q5op3.alpha = 0
self.q6op1.alpha = 0
self.q6op2.alpha = 0
self.q6op3.alpha = 0
self.q7op1.alpha = 0
self.q7op2.alpha = 0
self.q7op3.alpha = 0
        
        
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
