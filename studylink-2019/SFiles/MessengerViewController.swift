//
//  messengerViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/11/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class MessengerViewController: UIViewController {

  
    @IBOutlet var navBarImage: UIImageView!
    
    @IBOutlet var firstName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.navBarImage.layer.cornerRadius = self.navBarImage.frame.size.width / 2;
        self.navBarImage.clipsToBounds = true;
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
