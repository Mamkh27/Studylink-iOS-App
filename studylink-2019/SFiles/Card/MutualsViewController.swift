//
//  MutualsViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/20/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class MutualsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        closeButton()
        self.showAnimate()
    }
    func closeButton(){
        let button = UIButton(frame: CGRect(x: 150, y: 450, width: 70, height: 40))
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(buttonClose), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func buttonClose(sender: UIButton!) {
        self.removeAnimate()
    }
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
        })
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished: Bool) in
            if (finished){
                self.view.removeFromSuperview()
            }
        });
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
