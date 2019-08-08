//
//  WelcomeViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
import FirebaseAuth

class WelcomeViewController: UIViewController {

    @IBOutlet var Next: UIButton!
    
    @IBOutlet weak var please: UIImageView!
    @IBOutlet weak var study_link: UIImageView!
    @IBOutlet weak var welcome_view: UIView!
    @IBOutlet weak var welcome_to: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcome_to.alpha = 0.0
        if self.welcome_to.alpha == 0.0{
        self.welcome_to.fadeIn(duration: 0.75, delay:0.0, completion: nil)
        }
        
       
       
        self.view.bringSubviewToFront(self.welcome_to)
        self.view.bringSubviewToFront(self.study_link)
        self.view.bringSubviewToFront(self.please)
        self.view.bringSubviewToFront(self.Next)
        Next.layer.cornerRadius = 5;
        
        print(Auth.auth().currentUser)
        
    }


        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


