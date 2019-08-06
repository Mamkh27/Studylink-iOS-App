//
//  CardViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UICollectionViewDelegateFlowLayout {

   
 let cellId = "cellId"

    
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
  


        image.layer.cornerRadius = 5;
        image.layer.masksToBounds = true;

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

        
        
        
setupMenuOptions()
setupMenuBar()

        
print("This is" + self.menuBar.whichOptionisActive)
        
        let blurEffect1 = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView1 = UIVisualEffectView(effect: blurEffect1)
        blurEffectView1.frame = menuBar.frame
        blurEffectView1.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView1.alpha = 0.9;
        self.view.addSubview(blurEffectView1)
        
        /*
        if(self.menuBar.whichOptionisActive == "profile"){
            menuOptions.isRed()
    }
        else {
            menuOptions.isWhite()
        }
 */
    }
/*
    func setupFilterLabels(){
        self.view.addSubview(self.menuBar.menuOps.fltrThreeLbl)
        
        addConstraintsWithFormat("H:|[v0]|", views: menuBar.menuOps.fltrThreeLbl)
        addConstraintsWithFormat("V:|[v0(55)]", views: menuBar.menuOps.fltrThreeLbl)
        menuBar.menuOps.fltrThreeLbl.transform = CGAffineTransform(translationX:100, y: 360)
        
///////////////////////////////////////////////////////////////////////////
        
        self.view.addSubview(self.menuBar.menuOps.fltrTwoLbl)
        
        addConstraintsWithFormat("H:|[v0]|", views: menuBar.menuOps.fltrTwoLbl)
        addConstraintsWithFormat("V:|[v0(55)]", views: menuBar.menuOps.fltrTwoLbl)
         menuBar.menuOps.fltrTwoLbl.transform = CGAffineTransform(translationX: 0, y:360)
        
 ///////////////////////////////////////////////////////////////////////////
        
        self.view.addSubview(self.menuBar.menuOps.fltrOneLbl)
        
        addConstraintsWithFormat("H:|[v0]|", views: menuBar.menuOps.fltrOneLbl)
        addConstraintsWithFormat("V:|[v0(55)]", views: menuBar.menuOps.fltrOneLbl)
        menuBar.menuOps.fltrOneLbl.transform = CGAffineTransform(translationX: -100, y:360)
        
        
    }
   */
    
    
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
    


