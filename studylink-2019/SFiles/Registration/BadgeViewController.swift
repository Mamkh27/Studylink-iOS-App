//
//  BadgeViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController {

    
    var count = 0;

    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    @IBOutlet var b3: UIButton!
    @IBOutlet var b4: UIButton!
    @IBOutlet var b5: UIButton!
    @IBOutlet var b6: UIButton!
    @IBOutlet var b7: UIButton!
    @IBOutlet var b8: UIButton!
    @IBOutlet var b9: UIButton!
    @IBOutlet var b10: UIButton!
    @IBOutlet var b11: UIButton!
    @IBOutlet var b12: UIButton!
    @IBOutlet var b13: UIButton!
    @IBOutlet var b14: UIButton!
    @IBOutlet var b15: UIButton!
    @IBOutlet var b16: UIButton!
    @IBOutlet var b17: UIButton!
    @IBOutlet var b18: UIButton!
    @IBOutlet var b19: UIButton!
    @IBOutlet var b21: UIButton!
    @IBOutlet var b22: UIButton!
    @IBOutlet var b23: UIButton!
    @IBOutlet var b24: UIButton!
    @IBOutlet var b25: UIButton!
    @IBOutlet var b26: UIButton!
    @IBOutlet var b29: UIButton!
    @IBOutlet var b28: UIButton!

    @IBOutlet var nextbtn: UIButton!
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    @IBOutlet var view3: UIView!
    
//Makes sure user only chooses 7 badges
    func counter() -> Bool{
        if(self.count + 1 <= 7){
            self.count = self.count + 1;
            return true;
        }
        else{
            return false;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//background blur code
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)
        
//bring all views in front of the blur
        self.view.bringSubviewToFront(self.view1)
        self.view.bringSubviewToFront(self.nextbtn)
        self.view.bringSubviewToFront(self.view2)

        self.view.bringSubviewToFront(self.view3)

 
 
    }
    
//button changes color once selected
    @IBAction func b2(_ sender: Any) {
        if b2.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b2_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b2.setImage(tintedImage, for: .normal)
                b2.tintColor = .black
            }}
//if already selected then changes back to white
        else{
        b2.tintColor = .white
        self.count = self.count - 1;
                                }
        }
    
    @IBAction func b1(_ sender: Any) {
        if b1.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b1_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b1.setImage(tintedImage, for: .normal)
                b1.tintColor = .black
                                }}
        else{
            b1.tintColor = .none
            self.count = self.count - 1;
            }
        }
    
    @IBAction func b3(_ sender: Any) {
        if b3.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b3_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b3.setImage(tintedImage, for: .normal)
                b3.tintColor = .black
            }}
        else{
            b3.tintColor = .white
            self.count = self.count - 1;
            }
        }
  
    

    @IBAction func b4(_ sender: Any) {

        if b4.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b4_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b4.setImage(tintedImage, for: .normal)
            
            }}
        else{
            b4.tintColor = .white
            self.count = self.count - 1;
                        }
        }
    
    
    @IBAction func b5(_ sender: Any) {
        if b5.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b5_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b5.setImage(tintedImage, for: .normal)
                b5.tintColor = .black
            }}
        else{
            b5.tintColor = .white
            self.count = self.count - 1;
                        }
        }
    
    @IBAction func b6(_ sender: Any) {
        if b6.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b6_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b6.setImage(tintedImage, for: .normal)
                b6.tintColor = .black
            }}
        else{
            b6.tintColor = .white
            self.count = self.count - 1;
                        }
        }
    
    
    @IBAction func b7(_ sender: Any) {
        if b7.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b7_.png")
            let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b7.setImage(tintedImage, for: .normal)
                b7.tintColor = .black
            }}
        else{
            b7.tintColor = .white
            self.count = self.count - 1;
                        }
        }
    
    @IBAction func b8(_ sender: Any) {
        if b8.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b8_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b8.setImage(tintedImage, for: .normal)
                b8.tintColor = .black
            }}
        else{
            b8.tintColor = .white
            self.count = self.count - 1;
              }
    }
    
    @IBAction func b9(_ sender: Any) {
        if b2.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b9_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b9.setImage(tintedImage, for: .normal)
                b9.tintColor = .black
            }}
        else{
            b9.tintColor = .white
            self.count = self.count - 1;
                        }}
    
    
    @IBAction func b10(_ sender: Any) {
        if b10.tintColor != .black{
            if(self.counter()){
                let origImage = UIImage(named: "b10_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b10.setImage(tintedImage, for: .normal)
                b10.tintColor = .black
        }}
        else{
            b10.tintColor = .white
            self.count = self.count - 1;
                        }}
    
    
    @IBAction func b11(_ sender: Any) {
        if b11.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b11_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b11.setImage(tintedImage, for: .normal)
                b11.tintColor = .black
            }}
        else{
            b11.tintColor = .white
            self.count = self.count - 1;
                        }
    }
    
    @IBAction func b12(_ sender: Any) {
        if b12.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b12_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b12.setImage(tintedImage, for: .normal)
                b12.tintColor = .black
            }}
        else{
            b12.tintColor = .white
            self.count = self.count - 1;
                        }
        }
    
    @IBAction func b13(_ sender: Any) {
        if b13.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b13_.png")
                let titedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b13.setImage(titedImage, for: .normal)
                b13.tintColor = .black
            }}
        else{
            b13.tintColor = .white
            self.count = self.count - 1;
                        }
        }
    
    
    @IBAction func b14(_ sender: Any) {
        if b14.tintColor != .black{
            if(self.counter()){
                let origImage = UIImage(named: "b14_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b14.setImage(tintedImage, for: .normal)
                b14.tintColor = .black
            }}
        else{
            b14.tintColor = .white
            self.count = self.count - 1;
        }}
    
    @IBAction func b15(_ sender: Any) {

        if b15.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b15_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b15.setImage(tintedImage, for: .normal)
                b15.tintColor = .black
            }}
        else{
            b15.tintColor = .white
            self.count = self.count - 1;
                }
    }
    
    @IBAction func b16(_ sender: Any) {
        if b16.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b16_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b16.setImage(tintedImage, for: .normal)
                b16.tintColor = .black
            }}
        else{
            b16.tintColor = .white
            self.count = self.count - 1;
                }
    }
    
    @IBAction func b17(_ sender: Any) {
        if b17.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b17_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b17.setImage(tintedImage, for: .normal)
                b17.tintColor = .black
            }}
        else{
            b17.tintColor = .white
            self.count = self.count - 1;
                }
        }
    
    
    @IBAction func b18(_ sender: Any) {
        if b18.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b18_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b18.setImage(tintedImage, for: .normal)
                b18.tintColor = .black
            }}
        else{
            b18.tintColor = .white
            self.count = self.count - 1;
                }
    }
    
    @IBAction func b19(_ sender: Any) {
        if b19.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b19_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b19.setImage(tintedImage, for: .normal)
                b19.tintColor = .black
            }}
        else{
            b19.tintColor = .white
            self.count = self.count - 1;
        }
    }
    
    @IBAction func b21(_ sender: Any) {
        if b21.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b21_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b21.setImage(tintedImage, for: .normal)
                b21.tintColor = .black
            }}
        else{
            b21.tintColor = .white
            self.count = self.count - 1;
            }
    }
    
    @IBAction func b22(_ sender: Any) {
        if b22.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b22_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b22.setImage(tintedImage, for: .normal)
                b22.tintColor = .black
            }}
        else{
            b22.tintColor = .white
            self.count = self.count - 1;
                }
    }
    
    @IBAction func b23(_ sender: Any) {
        if b23.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b23_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b23.setImage(tintedImage, for: .normal)
                b23.tintColor = .black
            }}
        else {
            b23.tintColor = .white
            self.count = self.count - 1;
                }
    }
    @IBAction func b24(_ sender: Any) {
        if b24.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b24_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b24.setImage(tintedImage, for: .normal)
                b24.tintColor = .black
        }
        }
        else{
            b24.tintColor = .white
            self.count = self.count - 1 ;
                }}
    
    
    
    @IBAction func b25(_ sender: Any) {
        if b25.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b25_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b25.setImage(tintedImage, for: .normal)
                b25.tintColor = .black
            }}
        else{
            b25.tintColor = .white
            self.count = self.count - 1;
                                    }
    }
    
    @IBAction func b26(_ sender: Any) {
        if b26.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b26_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b26.setImage(tintedImage, for: .normal)
                b26.tintColor = .black
                            }}
        else{
            b26.tintColor = .white
            self.count = self.count - 1;
  
        }

    }
    
    @IBAction func b28(_ sender: Any) {
        if b28.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b28_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b28.setImage(tintedImage, for: .normal)
                b28.tintColor = .black
            }}
        else{
            b28.tintColor = .white
            self.count = self.count - 1;
        }}


    
    @IBAction func b29(_ sender: Any) {
        if b29.tintColor != .black{
           if(self.counter()){
                let origImage = UIImage(named: "b29_.png")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                b29.setImage(tintedImage, for: .normal)
                b29.tintColor = .black
        }
        }
        else{
            b29.tintColor = .white
            self.count = self.count - 1;
        }

    }
}
