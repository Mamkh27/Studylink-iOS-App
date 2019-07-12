//
//  CardViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    

    @IBOutlet var mutualLine: UIView!
    @IBOutlet var calendarLine: UIView!
    @IBOutlet var profileLine: UIView!
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
        mutualLine.alpha = 0;
        calendarLine.alpha = 0;
        profileLine.alpha = 1;

        card.layer.cornerRadius = 5;
        card.layer.masksToBounds = true;
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)
        self.view.bringSubviewToFront(self.profilebtn)
                
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
        
    
    @IBAction func calendarChosen(_ sender: Any) {
        self.calendarLine.alpha = 1;
        self.profileLine.alpha = 0;
        self.mutualLine.alpha = 0;
    }
    
    @IBAction func mutualChosen(_ sender: Any) {
        self.calendarLine.alpha = 0;
        self.profileLine.alpha = 0;
        self.mutualLine.alpha = 1;
    }
    
    @IBAction func profileChosen(_ sender: Any) {
        self.calendarLine.alpha = 0;
        self.profileLine.alpha = 1;
        self.mutualLine.alpha = 0;
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
            if card.center.y < 75 {
                //Move the card all the way up, off the screen
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x , y: card.center.y - 200 )
                    card.alpha = 0
                })
            performSegue(withIdentifier: "swipeUp", sender: self)
                return
            } else if card.center.x < 75 {
                //Move to left side to previous card
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0;
                })
                return
                
                //FIX ME: INSERT CODE FOR PREVIOUS CARD HERE
                
            } else if card.center.x > (view.frame.width - 85){
            //Move to right side to next card
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0;
                })
                
                //FIX ME: INSERT CODE FOR NEW CARD HERE
                
                return
            }
        //go back to center
        resetCard()
        }
        
    }
        func resetCard(){

            UIView.animate(withDuration: 0.2, animations: {
                self.card.center = self.view.center
                    self.linkedView.alpha = 0
                    self.card.alpha = 1
            })
  

        }
    
    @IBAction func resetBtn(_ sender: Any) {
        resetCard()
    }
 
    }
    


