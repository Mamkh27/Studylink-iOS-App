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
        if(self.count < 7){
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

        
//bring all views in front of the blur
        self.view.bringSubviewToFront(self.view1)
        self.view.bringSubviewToFront(self.nextbtn)
        self.view.bringSubviewToFront(self.view2)

        self.view.bringSubviewToFront(self.view3)

 
 
    }
    
//button changes color once selected
    @IBAction func b2(_ sender: Any) {
        if b2.backgroundColor != .black{
           if(self.counter()){
                b2.backgroundColor = .black
            }
        }
//if already selected then changes back to clear
        else{
        b2.backgroundColor = .clear
        self.count = self.count - 1;
                                }
        }
    
    @IBAction func b1(_ sender: Any) {
        if b1.backgroundColor != .black{
           if(self.counter()){
                b1.backgroundColor = .black
                                }}
        else{
            b1.backgroundColor = .clear
            self.count = self.count - 1;
            }
        }
    
    @IBAction func b3(_ sender: Any) {
        if b3.backgroundColor != .black{
           if(self.counter()){
                b3.backgroundColor = .black
            }}
        else{
            b3.backgroundColor = .clear
            self.count = self.count - 1;
            }
        }
  
    

    @IBAction func b4(_ sender: Any) {

        if b4.backgroundColor != .black{
           if(self.counter()){
            b4.backgroundColor = .black
            }}
        else{
            b4.backgroundColor = .clear
            self.count = self.count - 1;
                        }
        }
    
    
    @IBAction func b5(_ sender: Any) {
        if b5.backgroundColor != .black{
           if(self.counter()){
                b5.backgroundColor = .black
            }}
        else{
            b5.backgroundColor = .clear
            self.count = self.count - 1;
                        }
        }
    
    @IBAction func b6(_ sender: Any) {
        if b6.backgroundColor != .black{
           if(self.counter()){

                b6.backgroundColor = .black
            }}
        else{
            b6.backgroundColor = .clear
            self.count = self.count - 1;
                        }
        }
    
    
    @IBAction func b7(_ sender: Any) {
        if b7.backgroundColor != .black{
           if(self.counter()){

                b7.backgroundColor = .black
            }}
        else{
            b7.backgroundColor = .clear
            self.count = self.count - 1;
                        }
        }
    
    @IBAction func b8(_ sender: Any) {
        if b8.backgroundColor != .black{
           if(self.counter()){

                b8.backgroundColor = .black
            }}
        else{
            b8.backgroundColor = .clear
            self.count = self.count - 1;
              }
    }
    
    @IBAction func b9(_ sender: Any) {
        if b9.backgroundColor != .black{
           if(self.counter()){

                b9.backgroundColor = .black
            }}
        else{
            b9.backgroundColor = .clear
            self.count = self.count - 1;
                        }}
    
    
    @IBAction func b10(_ sender: Any) {
        if b10.backgroundColor != .black{
            if(self.counter()){

                b10.backgroundColor = .black
        }}
        else{
            b10.backgroundColor = .clear
            self.count = self.count - 1;
                        }}
    
    
    @IBAction func b11(_ sender: Any) {
        if b11.backgroundColor != .black{
           if(self.counter()){

                b11.backgroundColor = .black
            }}
        else{
            b11.backgroundColor = .clear
            self.count = self.count - 1;
                        }
    }
    
    @IBAction func b12(_ sender: Any) {
        if b12.backgroundColor != .black{
           if(self.counter()){

                b12.backgroundColor = .black
            }}
        else{
            b12.backgroundColor = .clear
            self.count = self.count - 1;
                        }
        }
    
    @IBAction func b13(_ sender: Any) {
        if b13.backgroundColor != .black{
           if(self.counter()){

                b13.backgroundColor = .black
            }}
        else{
            b13.backgroundColor = .clear
            self.count = self.count - 1;
                        }
        }
    
    
    @IBAction func b14(_ sender: Any) {
        if b14.backgroundColor != .black{
            if(self.counter()){

                b14.backgroundColor = .black
            }}
        else{
            b14.backgroundColor = .clear
            self.count = self.count - 1;
        }}
    
    @IBAction func b15(_ sender: Any) {

        if b15.backgroundColor != .black{
           if(self.counter()){

                b15.backgroundColor = .black
            }}
        else{
            b15.backgroundColor = .clear
            self.count = self.count - 1;
                }
    }
    
    @IBAction func b16(_ sender: Any) {
        if b16.backgroundColor != .black{
           if(self.counter()){

                b16.backgroundColor = .black
            }}
        else{
            b16.backgroundColor = .clear
            self.count = self.count - 1;
                }
    }
    
    @IBAction func b17(_ sender: Any) {
        if b17.backgroundColor != .black{
           if(self.counter()){

                b17.backgroundColor = .black
            }}
        else{
            b17.backgroundColor = .clear
            self.count = self.count - 1;
                }
        }
    
    
    @IBAction func b18(_ sender: Any) {
        if b18.backgroundColor != .black{
           if(self.counter()){

                b18.backgroundColor = .black
            }}
        else{
            b18.backgroundColor = .clear
            self.count = self.count - 1;
                }
    }
    
    @IBAction func b19(_ sender: Any) {
        if b19.backgroundColor != .black{
           if(self.counter()){

                b19.backgroundColor = .black
            }}
        else{
            b19.backgroundColor = .clear
            self.count = self.count - 1;
        }
    }
    
    @IBAction func b21(_ sender: Any) {
        if b21.backgroundColor != .black{
           if(self.counter()){

                b21.backgroundColor = .black
            }}
        else{
            b21.backgroundColor = .clear
            self.count = self.count - 1;
            }
    }
    
    @IBAction func b22(_ sender: Any) {
        if b22.backgroundColor != .black{
           if(self.counter()){

                b22.backgroundColor = .black
            }}
        else{
            b22.backgroundColor = .clear
            self.count = self.count - 1;
                }
    }
    
    @IBAction func b23(_ sender: Any) {
        if b23.backgroundColor != .black{
           if(self.counter()){

                b23.backgroundColor = .black
            }}
        else {
            b23.backgroundColor = .clear
            self.count = self.count - 1;
                }
    }
    @IBAction func b24(_ sender: Any) {
        if b24.backgroundColor != .black{
           if(self.counter()){

                b24.backgroundColor = .black
        }
        }
        else{
            b24.backgroundColor = .clear
            self.count = self.count - 1 ;
                }}
    
    
    
    @IBAction func b25(_ sender: Any) {
        if b25.backgroundColor != .black{
           if(self.counter()){

                b25.backgroundColor = .black
            }}
        else{
            b25.backgroundColor = .clear
            self.count = self.count - 1;
                                    }
    }
    
    @IBAction func b26(_ sender: Any) {
        if b26.backgroundColor != .black{
           if(self.counter()){

                b26.backgroundColor = .black
                            }}
        else{
            b26.backgroundColor = .clear
            self.count = self.count - 1;
  
        }

    }
    
    @IBAction func b28(_ sender: Any) {
        if b28.backgroundColor != .black{
           if(self.counter()){
                b28.backgroundColor = .black
            }}
        else{
            b28.backgroundColor = .clear
            self.count = self.count - 1;
        }}


    
    @IBAction func b29(_ sender: Any) {
        if b29.backgroundColor != .black{
           if(self.counter()){
                b29.backgroundColor = .black

            }}
        else{
            b29.backgroundColor = .clear
            self.count = self.count - 1;
        }

    }

    }
