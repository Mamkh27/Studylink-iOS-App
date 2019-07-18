//
//  TabViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/15/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var tabFrame:CGRect = self.tabBar.frame
        tabFrame.origin.y = self.view.frame.origin.y + 365
 
        self.tabBar.frame = tabFrame
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
