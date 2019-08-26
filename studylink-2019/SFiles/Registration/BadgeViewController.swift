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
    
    var selectedBadges: [String] = []
    var navy = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
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
       // self.view.bringSubviewToFront(self.view2)

        self.view.bringSubviewToFront(self.view3)

 
 
    }
    

//button changes color once selected
@IBAction func b2(_ sender: Any) {
    
    if b2.backgroundColor != navy {
        if(self.counter()){
            b2.backgroundColor = navy
            b2.setTitleColor(.white, for: .normal)
        }
    }
        //if already selected then changes back to clear
    else{
        b2.backgroundColor = .clear
        self.count = self.count - 1;
        
    }
}

@IBAction func b1(_ sender: Any) {
    if b1.backgroundColor != navy{
        if(self.counter()){
            b1.backgroundColor = navy
         b1.setTitleColor(.white, for: .normal)
        }}
    else{
        b1.backgroundColor = .clear
        self.count = self.count - 1;
        b1.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b3(_ sender: Any) {
    if b3.backgroundColor != navy{
        if(self.counter()){
            b3.backgroundColor = navy
            b3.setTitleColor(.white, for: .normal)
        }}
    else{
        b3.backgroundColor = .clear
        self.count = self.count - 1;
        b3.setTitleColor(.black, for: .normal)
    }
}



@IBAction func b4(_ sender: Any) {
    
    if b4.backgroundColor != navy{
        if(self.counter()){
            b4.backgroundColor = navy
             b4.setTitleColor(.white, for: .normal)
        }}
    else{
        b4.backgroundColor = .clear
        self.count = self.count - 1;
        b4.setTitleColor(.black, for: .normal)
    }
}


@IBAction func b5(_ sender: Any) {
    if b5.backgroundColor != navy{
        if(self.counter()){
            b5.backgroundColor = navy
             b5.setTitleColor(.white, for: .normal)
        }}
    else{
        b5.backgroundColor = .clear
        self.count = self.count - 1;
        b5.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b6(_ sender: Any) {
    if b6.backgroundColor != navy{
        if(self.counter()){
            
            b6.backgroundColor = navy
             b6.setTitleColor(.white, for: .normal)
        }}
    else{
        b6.backgroundColor = .clear
        self.count = self.count - 1;
        b6.setTitleColor(.black, for: .normal)
    }
}


@IBAction func b7(_ sender: Any) {
    if b7.backgroundColor != navy{
        if(self.counter()){
            
            b7.backgroundColor = navy
             b7.setTitleColor(.white, for: .normal)
        }}
    else{
        b7.backgroundColor = .clear
        self.count = self.count - 1;
        b7.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b8(_ sender: Any) {
    if b8.backgroundColor != navy{
        if(self.counter()){
            
            b8.backgroundColor = navy
             b8.setTitleColor(.white, for: .normal)
        }}
    else{
        b8.backgroundColor = .clear
        self.count = self.count - 1;
        b8.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b9(_ sender: Any) {
    if b9.backgroundColor != navy{
        if(self.counter()){
            
            b9.backgroundColor = navy
             b9.setTitleColor(.white, for: .normal)
        }}
    else{
        b9.backgroundColor = .clear
        self.count = self.count - 1;
        b9.setTitleColor(.black, for: .normal)
    }}


@IBAction func b10(_ sender: Any) {
    if b10.backgroundColor != navy{
        if(self.counter()){
            
            b10.backgroundColor = navy
             b10.setTitleColor(.white, for: .normal)
        }}
    else{
        b10.backgroundColor = .clear
        self.count = self.count - 1;
        b10.setTitleColor(.black, for: .normal)
    }}


@IBAction func b11(_ sender: Any) {
    if b11.backgroundColor != navy{
        if(self.counter()){
            
            b11.backgroundColor = navy
             b11.setTitleColor(.white, for: .normal)
        }}
    else{
        b11.backgroundColor = .clear
        self.count = self.count - 1;
        b11.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b12(_ sender: Any) {
    if b12.backgroundColor != navy{
        if(self.counter()){
            
            b12.backgroundColor = navy
             b12.setTitleColor(.white, for: .normal)
        }}
    else{
        b12.backgroundColor = .clear
        self.count = self.count - 1;
        b12.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b13(_ sender: Any) {
    if b13.backgroundColor != navy{
        if(self.counter()){
            
            b13.backgroundColor = navy
             b13.setTitleColor(.white, for: .normal)
        }}
    else{
        b13.backgroundColor = .clear
        self.count = self.count - 1;
        b13.setTitleColor(.black, for: .normal)
    }
}


@IBAction func b14(_ sender: Any) {
    if b14.backgroundColor != navy{
        if(self.counter()){
            
            b14.backgroundColor = navy
             b14.setTitleColor(.white, for: .normal)
        }}
    else{
        b14.backgroundColor = .clear
        self.count = self.count - 1;
        b14.setTitleColor(.black, for: .normal)
    }}

@IBAction func b15(_ sender: Any) {
    
    if b15.backgroundColor != navy{
        if(self.counter()){
            
            b15.backgroundColor = navy
             b15.setTitleColor(.white, for: .normal)
        }}
    else{
        b15.backgroundColor = .clear
        self.count = self.count - 1;
        b15.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b16(_ sender: Any) {
    if b16.backgroundColor != navy{
        if(self.counter()){
            
            b16.backgroundColor = navy
             b16.setTitleColor(.white, for: .normal)
        }}
    else{
        b16.backgroundColor = .clear
        self.count = self.count - 1;
        b16.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b17(_ sender: Any) {
    if b17.backgroundColor != navy{
        if(self.counter()){
            
            b17.backgroundColor = navy
             b17.setTitleColor(.white, for: .normal)
        }}
    else{
        b17.backgroundColor = .clear
        self.count = self.count - 1;
        b17.setTitleColor(.black, for: .normal)
    }
}


@IBAction func b18(_ sender: Any) {
    if b18.backgroundColor != navy{
        if(self.counter()){
            
            b18.backgroundColor = navy
             b18.setTitleColor(.white, for: .normal)
        }}
    else{
        b18.backgroundColor = .clear
        self.count = self.count - 1;
        b18.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b19(_ sender: Any) {
    if b19.backgroundColor != navy{
        if(self.counter()){
            
            b19.backgroundColor = navy
             b19.setTitleColor(.white, for: .normal)
        }}
    else{
        b19.backgroundColor = .clear
        self.count = self.count - 1;
        b19.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b21(_ sender: Any) {
    if b21.backgroundColor != navy{
        if(self.counter()){
            
            b21.backgroundColor = navy
             b21.setTitleColor(.white, for: .normal)
        }}
    else{
        b21.backgroundColor = .clear
        self.count = self.count - 1;
        b21.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b22(_ sender: Any) {
    if b22.backgroundColor != navy{
        if(self.counter()){
            
            b22.backgroundColor = navy
             b22.setTitleColor(.white, for: .normal)
        }}
    else{
        b22.backgroundColor = .clear
        self.count = self.count - 1;
        b22.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b23(_ sender: Any) {
    if b23.backgroundColor != navy{
        if(self.counter()){
            
            b23.backgroundColor = navy
             b23.setTitleColor(.white, for: .normal)
        }}
    else {
        b23.backgroundColor = .clear
        self.count = self.count - 1;
        b23.setTitleColor(.black, for: .normal)
    }
}
@IBAction func b24(_ sender: Any) {
    if b24.backgroundColor != navy{
        if(self.counter()){
            
            b24.backgroundColor = navy
             b24.setTitleColor(.white, for: .normal)
        }
    }
    else{
        b24.backgroundColor = .clear
        self.count = self.count - 1 ;
        b24.setTitleColor(.black, for: .normal)
    }}



@IBAction func b25(_ sender: Any) {
    if b25.backgroundColor != navy{
        if(self.counter()){
            
            b25.backgroundColor = navy
             b25.setTitleColor(.white, for: .normal)
        }}
    else{
        b25.backgroundColor = .clear
        self.count = self.count - 1;
        b25.setTitleColor(.black, for: .normal)
    }
}

@IBAction func b26(_ sender: Any) {
    if b26.backgroundColor != navy{
        if(self.counter()){
            
            b26.backgroundColor = navy
             b26.setTitleColor(.white, for: .normal)
        }}
    else{
        b26.backgroundColor = .clear
        self.count = self.count - 1;
        b26.setTitleColor(.black, for: .normal)
        
    }
    
}

@IBAction func b28(_ sender: Any) {
    if b28.backgroundColor != navy{
        if(self.counter()){
            b28.backgroundColor = navy
             b28.setTitleColor(.white, for: .normal)
        }}
    else{
        b28.backgroundColor = .clear
        self.count = self.count - 1;
        b28.setTitleColor(.black, for: .normal)
    }}



@IBAction func b29(_ sender: Any) {
    if b29.backgroundColor != navy{
        if(self.counter()){
            b29.backgroundColor = navy
             b29.setTitleColor(.white, for: .normal)
            
        }}
    else{
        b29.backgroundColor = .clear
        self.count = self.count - 1;
        b29.setTitleColor(.black, for: .normal)
    }
    
}

}
