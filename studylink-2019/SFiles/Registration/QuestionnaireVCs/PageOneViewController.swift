//
//  PageOneViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/11/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController {
    var maleChosen = false
    var femaleChosen = false
    
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var maleLbl: UIButton!
    @IBOutlet var femaleLbl: UIButton!
    @IBOutlet var selectLbl: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        selectLbl.alpha = 0
        nextBtn.alpha = 0
        maleLbl.alpha = 0
        femaleLbl.alpha = 0
        
        // Do sany additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {
            
             self.selectLbl.alpha = 1
        })  {(true) in

            self.showQ1()
        }
    }
    
    func showQ1(){
        UIView.animate(withDuration: 1, animations: {
            self.maleLbl.alpha = 1
        }, completion: { (true) in
           self.showFemale()
        })
    }
    //
    func showMale(){
        UIView.animate(withDuration: 1, animations: {
            self.maleLbl.alpha = 1
        }, completion: { (true) in
            self.showFemale()
        })
    }

    func showFemale(){
        UIView.animate(withDuration: 1, animations: {
            self.femaleLbl.alpha = 1
        }, completion: { (true) in
        })
        
    }
    
    @IBAction func FemaleTapped(_ sender: Any) {
        if(femaleChosen){
            femaleLbl.backgroundColor = .white
            femaleLbl.setTitleColor(.darkGray, for: .normal)
            femaleChosen = false
            hideNext()
        }
        else if(!femaleChosen && maleChosen){
            maleLbl.backgroundColor = .white
            maleLbl.setTitleColor(.darkGray, for: .normal)
            maleChosen = false
            
            femaleLbl.backgroundColor = .darkGray
            femaleLbl.setTitleColor(.white, for: .normal)
            femaleLbl.layer.cornerRadius = 5
            femaleChosen = true
        }
        else{
            femaleLbl.backgroundColor = .darkGray
            femaleLbl.setTitleColor(.white, for: .normal)
            femaleLbl.layer.cornerRadius = 5
            femaleChosen = true
            self.showNext()
           
        }
    }
    
    @IBAction func MaleTapped(_ sender: Any) {
        if(maleChosen){
            maleLbl.backgroundColor = .white
            maleLbl.setTitleColor(.darkGray, for: .normal)
            maleChosen = false
            hideNext()
        }
        else if (!maleChosen && femaleChosen){
            maleLbl.backgroundColor = .darkGray
            maleLbl.setTitleColor(.white, for: .normal)
            maleLbl.layer.cornerRadius = 5
            maleChosen = true
            
            femaleLbl.backgroundColor = .white
            femaleLbl.setTitleColor(.darkGray, for: .normal)
            femaleChosen = false
        }
        else{
        maleLbl.backgroundColor = .darkGray
        maleLbl.setTitleColor(.white, for: .normal)
        maleLbl.layer.cornerRadius = 5
            maleChosen = true
            self.showNext()
           
        }}
    
    func showNext(){
        
        UIView.animate(withDuration: 1) {
            self.nextBtn.alpha = 1
        }
    }
    func hideNext(){
        UIView.animate(withDuration: 1) {
            self.nextBtn.alpha = 0
        }
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
