//
//  PageFourViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/11/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class PageFourViewController: UIViewController {

    @IBOutlet var q5: UIImageView!
    @IBOutlet var q6: UIImageView!
    @IBOutlet var q7: UIImageView!
    @IBOutlet var q5op1: UIButton!
    @IBOutlet var q5op2: UIButton!
    @IBOutlet var q5op3: UIButton!
    @IBOutlet var q6op1: UIButton!
    @IBOutlet var q6op2: UIButton!
    @IBOutlet var q6op3: UIButton!
    @IBOutlet var q7op1: UIButton!
    @IBOutlet var q7op2: UIButton!
    @IBOutlet var q7op3: UIButton!
    @IBOutlet var nextBtn: UIButton!
    
    var Q5Op1Tapped = false
    var Q5Op2Tapped = false
    var Q5Op3Tapped = false
    var Q6Op1Tapped = false
    var Q6Op2Tapped = false
    var Q6Op3Tapped = false
    var Q7Op1Tapped = false
    var Q7Op2Tapped = false
    var Q7Op3Tapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        UIView.animate(withDuration: 1, animations: {
            self.q5.alpha = 1
        }) {(true) in
            self.showOptionOne()
        }
}
    

    func initialSetup(){
        self.q5.alpha = 0
        self.q6.alpha = 0
        self.q7.alpha = 0
        self.nextBtn.alpha = 0
        self.q5op1.alpha = 0
        self.q5op2.alpha = 0
        self.q5op3.alpha = 0
        self.q6op1.alpha = 0
        self.q6op2.alpha = 0
        self.q6op3.alpha = 0
        self.q7op1.alpha = 0
        self.q7op2.alpha = 0
        self.q7op3.alpha = 0
    }
    
    
//first question animations
////////////////////////////////////////////////////////////////////////////////
    
    func showOptionOne(){
        UIView.animate(withDuration: 1, animations: {
            self.q5op1.alpha = 1
        }) { (true) in
            self.showOptionTwo()
        }
    }
    
    func showOptionTwo(){
        UIView.animate(withDuration: 1, animations: {
            self.q5op2.alpha = 1
        }) { (true) in
            self.showOptionThree()
        }
    }
    
    func showOptionThree(){
        UIView.animate(withDuration: 1, animations: {
            self.q5op3.alpha = 1
        })
    }
    
    
    @IBAction func q5op1tapped(_ sender: Any) {
        showQuestionSix()
        
        if (!Q5Op1Tapped && !Q5Op2Tapped && !Q5Op3Tapped){
            q5op1.backgroundColor = .darkGray
            q5op1.setTitleColor(.white, for: .normal)
            Q5Op1Tapped = true
        }
        else if (!Q5Op1Tapped && Q5Op3Tapped && !Q5Op2Tapped){
            q5op1.backgroundColor = .darkGray
            q5op1.setTitleColor(.white, for: .normal)
            Q5Op1Tapped = true
            Q5Op3Tapped = false
            q5op3.backgroundColor = .white
            q5op3.setTitleColor(.darkGray, for: .normal)
        }
        else if (Q5Op2Tapped){
            q5op1.backgroundColor = .darkGray
            q5op1.setTitleColor(.white, for: .normal)
            Q5Op1Tapped = true
            Q5Op2Tapped = false
            q5op2.backgroundColor = .white
            q5op2.setTitleColor(.darkGray, for: .normal)
        }
    }
    
    @IBAction func q5op2tapped(_ sender: Any) {
        showQuestionSix()
        
        if(!Q5Op1Tapped && !Q5Op2Tapped && !Q5Op3Tapped){
            q5op2.backgroundColor = .darkGray
            q5op2.setTitleColor(.white, for: .normal)
            Q5Op2Tapped = true
        }
        else if (!Q5Op1Tapped && Q5Op3Tapped && !Q5Op2Tapped){
            q5op2.backgroundColor = .darkGray
            q5op2.setTitleColor(.white, for: .normal)
            Q5Op2Tapped = true
            Q5Op3Tapped = false
            q5op3.backgroundColor = .white
            q5op3.setTitleColor(.darkGray, for: .normal)
        }
        else if(Q6Op1Tapped){
            q5op2.backgroundColor = .darkGray
            q5op2.setTitleColor(.white, for: .normal)
            Q5Op2Tapped = true
            Q5Op1Tapped = false
            q5op1.backgroundColor = .white
            q5op1.setTitleColor(.darkGray, for: .normal)
        }
        else {
            q5op2.backgroundColor = .darkGray
            q5op2.setTitleColor(.white, for: .normal)
            Q5Op2Tapped = true
        }
    }
    
    @IBAction func q5op3tapped(_ sender: Any) {
        showQuestionSix()
        if(!Q5Op3Tapped){
            q5op1.backgroundColor = .white
            q5op2.backgroundColor = .white
            q5op1.setTitleColor(.darkGray, for: .normal)
            q5op2.setTitleColor(.darkGray, for: .normal)
            q5op3.backgroundColor = .darkGray
            q5op3.setTitleColor(.white, for: .normal)
            Q5Op1Tapped = false
            Q5Op2Tapped = false
            Q5Op3Tapped = true
        }
    }
   
//second question animations
///////////////////////////////////////////////////////////////////////////////////
 
    func showQuestionSix(){
        UIView.animate(withDuration: 1, animations:{
            self.q6.alpha = 1
        }) {(true) in
        self.showQ6O1()
        }}

func showQ6O1(){
    UIView.animate(withDuration: 1, animations: {
        self.q6op1.alpha = 1
    }) { (true) in
        self.showQ6O2()
    }
}

func showQ6O2(){
    UIView.animate(withDuration: 1, animations: {
        self.q6op2.alpha = 1
    }) { (true) in
        self.showQ6O3()
    }
}

func showQ6O3(){
    UIView.animate(withDuration: 1, animations: {
        self.q6op3.alpha = 1
    })
}
    
    
    @IBAction func q6o1tapped(_ sender: Any) {
        showQuestionSeven()
        if (!Q6Op1Tapped && !Q6Op2Tapped && !Q6Op3Tapped){
            q6op1.backgroundColor = .darkGray
            q6op1.setTitleColor(.white, for: .normal)
            Q6Op1Tapped = true
        }
        else if (!Q6Op1Tapped && Q6Op3Tapped && !Q6Op2Tapped){
            q6op1.backgroundColor = .darkGray
            q6op1.setTitleColor(.white, for: .normal)
            Q6Op1Tapped = true
            Q6Op3Tapped = false
            q6op3.backgroundColor = .white
            q6op3.setTitleColor(.darkGray, for: .normal)
        }
        else if (Q6Op2Tapped){
            q6op1.backgroundColor = .darkGray
            q6op1.setTitleColor(.white, for: .normal)
            Q6Op1Tapped = true
            Q6Op2Tapped = false
            q6op2.backgroundColor = .white
            q6op2.setTitleColor(.darkGray, for: .normal)
        }
    }
    
    @IBAction func q6o2tapped(_ sender: Any) {
        showQuestionSeven()
        
        if(!Q6Op1Tapped && !Q6Op2Tapped && !Q6Op3Tapped){
            q6op2.backgroundColor = .darkGray
            q6op2.setTitleColor(.white, for: .normal)
            Q6Op2Tapped = true
        }
        else if (!Q6Op1Tapped && Q6Op3Tapped && !Q6Op2Tapped){
            q6op2.backgroundColor = .darkGray
            q6op2.setTitleColor(.white, for: .normal)
            Q6Op2Tapped = true
            Q6Op3Tapped = false
            q6op3.backgroundColor = .white
            q6op3.setTitleColor(.darkGray, for: .normal)
        }
        else if(Q6Op1Tapped){
            q6op2.backgroundColor = .darkGray
            q6op2.setTitleColor(.white, for: .normal)
            Q6Op2Tapped = true
            Q6Op1Tapped = false
            q6op1.backgroundColor = .white
            q6op1.setTitleColor(.darkGray, for: .normal)
        }
        else {
            q6op2.backgroundColor = .darkGray
            q6op2.setTitleColor(.white, for: .normal)
            Q6Op2Tapped = true
        }
    }
    
    
    @IBAction func q6o3tapped(_ sender: Any) {
        showQuestionSeven()
        
        if(!Q6Op3Tapped){
            q6op1.backgroundColor = .white
            q6op2.backgroundColor = .white
            q6op1.setTitleColor(.darkGray, for: .normal)
            q6op2.setTitleColor(.darkGray, for: .normal)
            q6op3.backgroundColor = .darkGray
            q6op3.setTitleColor(.white, for: .normal)
            Q6Op1Tapped = false
            Q6Op2Tapped = false
            Q6Op3Tapped = true
        }
    }
    
    //third question animations
///////////////////////////////////////////////////////////////////////////////////
    func showQuestionSeven(){
        UIView.animate(withDuration: 1, animations:{
            self.q7.alpha = 1
        }) {(true) in
            self.showQ7O1()
        }}
    
    func showQ7O1(){
        UIView.animate(withDuration: 1, animations: {
            self.q7op1.alpha = 1
        }) { (true) in
            self.showQ7O2()
        }
    }
    
    func showQ7O2(){
        UIView.animate(withDuration: 1, animations: {
            self.q7op2.alpha = 1
        }) { (true) in
            self.showQ7O3()
        }
    }
    
    func showQ7O3(){
        UIView.animate(withDuration: 1, animations: {
            self.q7op3.alpha = 1
        })
    }
    
    @IBAction func q7o1tapped(_ sender: Any) {
        self.nextBtn.alpha = 1
        if (!Q7Op1Tapped && !Q7Op2Tapped && !Q7Op3Tapped){
            q7op1.backgroundColor = .darkGray
            q7op1.setTitleColor(.white, for: .normal)
            Q7Op1Tapped = true
        }
        else if (!Q7Op1Tapped && Q7Op3Tapped && !Q7Op2Tapped){
            q7op1.backgroundColor = .darkGray
            q7op1.setTitleColor(.white, for: .normal)
            Q7Op1Tapped = true
            Q7Op3Tapped = false
            q7op3.backgroundColor = .white
            q7op3.setTitleColor(.darkGray, for: .normal)
        }
        else if (Q7Op2Tapped){
            q7op1.backgroundColor = .darkGray
            q7op1.setTitleColor(.white, for: .normal)
            Q7Op1Tapped = true
            Q7Op2Tapped = false
            q7op2.backgroundColor = .white
            q7op2.setTitleColor(.darkGray, for: .normal)
        }
    }
    
    
    @IBAction func q7o2tapped(_ sender: Any) {
        self.nextBtn.alpha = 1
        
        if(!Q7Op1Tapped && !Q7Op2Tapped && !Q7Op3Tapped){
            q7op2.backgroundColor = .darkGray
            q7op2.setTitleColor(.white, for: .normal)
            Q7Op2Tapped = true
        }
        else if (!Q7Op1Tapped && Q7Op3Tapped && !Q7Op2Tapped){
            q7op2.backgroundColor = .darkGray
            q7op2.setTitleColor(.white, for: .normal)
            Q7Op2Tapped = true
            Q7Op3Tapped = false
            q7op3.backgroundColor = .white
            q7op3.setTitleColor(.darkGray, for: .normal)
        }
        else if(Q7Op1Tapped){
            q7op2.backgroundColor = .darkGray
            q7op2.setTitleColor(.white, for: .normal)
            Q7Op2Tapped = true
            Q7Op1Tapped = false
            q7op1.backgroundColor = .white
            q7op1.setTitleColor(.darkGray, for: .normal)
        }
        else {
            q7op2.backgroundColor = .darkGray
            q7op2.setTitleColor(.white, for: .normal)
            Q7Op2Tapped = true
        }
    }

    
    @IBAction func q7o3tapped(_ sender: Any) {
        self.nextBtn.alpha = 1
        
        if(!Q7Op3Tapped){
            q7op1.backgroundColor = .white
            q7op2.backgroundColor = .white
            q7op1.setTitleColor(.darkGray, for: .normal)
            q7op2.setTitleColor(.darkGray, for: .normal)
            q7op3.backgroundColor = .darkGray
            q7op3.setTitleColor(.white, for: .normal)
            Q7Op1Tapped = false
            Q7Op2Tapped = false
            Q7Op3Tapped = true
        }
    }
    
    
    //end of class
}
