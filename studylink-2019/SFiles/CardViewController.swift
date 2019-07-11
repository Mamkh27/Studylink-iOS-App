//
//  CardViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    
    @IBOutlet var view3: UIView!
    @IBOutlet var buttonsView: UIView!
    
    @IBOutlet var linkedView: UIImageView!
    @IBOutlet var lastInitial: UILabel!
    @IBOutlet var firstName: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var view2: UIView!
    @IBOutlet var card: UIView!
    @IBOutlet var toggleMenuButton: UIButton!
    @IBOutlet var darkFillView: RoundButton!
    @IBOutlet var menuView: UIView!
    @IBOutlet var profilebtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)
        self.view.bringSubviewToFront(self.profilebtn)
                self.view.bringSubviewToFront(self.view3)
        self.view.bringSubviewToFront(self.card)
        self.view.bringSubviewToFront(self.view2)
    self.view.bringSubviewToFront(self.toggleMenuButton)
        self.view.bringSubviewToFront(self.darkFillView)
        self.view.bringSubviewToFront(self.menuView)
        self.view.bringSubviewToFront(self.image)

        self.view.bringSubviewToFront(self.firstName)
        
        self.view.bringSubviewToFront(self.lastInitial)
        self.view.bringSubviewToFront(self.buttonsView)

    }
        
    
    
    
    @IBAction func toggleMenu(_ sender: Any) {
        if darkFillView.transform == CGAffineTransform.identity {
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = CGAffineTransform(scaleX: 18, y: 11)
                self.menuView.transform = CGAffineTransform(translationX:0, y:-67)
                self.toggleMenuButton.transform = CGAffineTransform(rotationAngle: self.radians(degrees: 180))
            }) {(true) in
                
            }
        } else{
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = .identity
                self.menuView.transform = .identity
                self.toggleMenuButton.transform = .identity
                
            }) {(true) in
                
            }
        }
    }
        
        func radians(degrees: Double) -> CGFloat{
            return CGFloat(degrees * .pi / degrees)
        }
    

    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let yFromCenter = card.center.y - view.center.y
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if yFromCenter < 0 {
            linkedView.image = UIImage(named: "linked.png")

            linkedView.tintColor = .green
            
        } else {
            linkedView.image = nil;
        }
        
        linkedView.alpha = abs(yFromCenter) / view.center.y
        
        if sender.state == UIGestureRecognizer.State.ended {
            linkedView.alpha = 0
        UIView.animate(withDuration: 0.2, animations: {
            card.center = self.view.center
            })
        }
    }
}
