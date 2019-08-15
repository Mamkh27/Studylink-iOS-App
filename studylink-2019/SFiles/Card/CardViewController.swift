//
//  CardViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit


class CardViewController: UIViewController {
    
            let cellId = "cellId"
    
    @IBOutlet weak var mutualLine: UIView!
    @IBOutlet weak var calendarLine: UIView!
    @IBOutlet weak var profileLine: UIView!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet var calendarBtn: UIButton!
    
    
    @IBOutlet var chatbtn: UIButton!
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
    
    
    @IBAction func popUpCalendar(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "calendarPopUpID") as! CalendarViewController
        
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.cornerRadius = 5;
        image.layer.masksToBounds = true;
        
        calendarBtn.tintColor =  UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        
        let origImage = UIImage(named: "calendar.png")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        calendarBtn.setImage(tintedImage, for: .normal)
        calendarBtn.tintColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
    
        
        self.view.bringSubviewToFront(self.profilebtn)
        self.view.bringSubviewToFront(self.chatbtn)
        self.view.bringSubviewToFront(self.card)
        self.view.bringSubviewToFront(self.image)
        self.view.bringSubviewToFront(self.firstName)
        self.view.bringSubviewToFront(self.lastInitial)
        self.view.bringSubviewToFront(self.calendarBtn)
        
        
   
   //     setUpNavbar()
       // setupMenuOptions()
      //  setupMenuBar()

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = menuBar.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)

    }
    
    
    @objc func chatPage(){
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "messengerView") as! MessengerViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

        
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
            var viewDict = [String: UIView]()
            
            for (index, view) in views.enumerated() {
                let key = "v\(index)"
                view.translatesAutoresizingMaskIntoConstraints = false
                viewDict[key] = view
            }
            
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
        }
        
        let menuBar: MenuBar = {
            let mb = MenuBar()
            return mb
        }()
        
        let menuOptions: MenuOptions = {
            let mo = MenuOptions()
            return mo
        }()
        
        private func setupMenuBar(){
            view.addSubview(menuBar)
            
            addConstraintsWithFormat("H:|[v0]|", views: menuBar)
            addConstraintsWithFormat("V:|[v0(55)]", views: menuBar)
            menuBar.transform = CGAffineTransform(translationX: 0, y: 615)
            
            
        }
        
        private func setupMenuOptions(){
            view.addSubview(menuBar.menuOps)
            addConstraintsWithFormat("H:|[v0]|", views: menuBar.menuOps)
            addConstraintsWithFormat("V:|[v0(215)]", views: menuBar.menuOps)
            
            menuBar.menuOps.transform = CGAffineTransform(translationX: 0, y: 395)
            
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





