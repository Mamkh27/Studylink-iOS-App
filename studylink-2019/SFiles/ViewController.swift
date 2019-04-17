//
//  ViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 4/16/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


   
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cambox: UIImageView!

    @IBAction func selectmenu(_ sender: Any) {
    }
    @IBAction func editprofile(_ sender: Any) {
    }
    @IBAction func cambox(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0).cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        
        
        cambox.layer.borderWidth = 1
        cambox.layer.masksToBounds = false
        cambox.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0).cgColor
        cambox.layer.cornerRadius = cambox.frame.height/2
        cambox.clipsToBounds = true

      

        // Do any additional setup after loading the view, typically from a nib.
    }


}

