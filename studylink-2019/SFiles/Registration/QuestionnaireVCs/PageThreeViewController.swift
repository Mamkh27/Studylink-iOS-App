//
//  PageThreeViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/11/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class PageThreeViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
   let options = ["1","2","3","4","5"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showNextBtn()
    }
 
    @IBOutlet var nextBrn: UIButton!
    @IBOutlet var pickerview: UIPickerView!
    @IBOutlet var q4: UIImageView!
    @IBOutlet var option1: UIButton!
    @IBOutlet var q3: UIImageView!

    @IBOutlet var option2: UIButton!
    @IBOutlet var option3: UIButton!

    var Op1Tapped = false
    var Op2Tapped = false
    var Op3Tapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.q3.alpha = 0
        self.option1.alpha = 0
        self.option2.alpha = 0
        self.option3.alpha = 0
        self.q4.alpha = 0
        self.pickerview.alpha = 0
        self.nextBrn.alpha = 0
        self.option1.layer.cornerRadius = 5
        self.option2.layer.cornerRadius = 5
        self.option3.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, animations: {
            self.q3.alpha = 1
        }) { (true) in
            self.showOptionOne()
        }
    }

    func showOptionOne(){
    UIView.animate(withDuration: 1, animations: {
    self.option1.alpha = 1
    }) { (true) in
        self.showOptionTwo()
    }
    }
    
    func showOptionTwo(){
    UIView.animate(withDuration: 1, animations: {
    self.option2.alpha = 1
    }) { (true) in
    self.showOptionThree()
    }
    }

    func showOptionThree(){
        UIView.animate(withDuration: 1, animations: {
            self.option3.alpha = 1
        })
    }
    
    @IBAction func O1Tapped(_ sender: Any) {
nextQuestion()
        if (!Op1Tapped && !Op2Tapped && !Op3Tapped){
            option1.backgroundColor = .darkGray
            option1.setTitleColor(.white, for: .normal)
            Op1Tapped = true
        }
        else if (!Op1Tapped && Op3Tapped && !Op2Tapped){
            option1.backgroundColor = .darkGray
            option1.setTitleColor(.white, for: .normal)
            Op1Tapped = true
            Op3Tapped = false
            option3.backgroundColor = .white
            option3.setTitleColor(.darkGray, for: .normal)
        }
        else if (Op2Tapped){
            option1.backgroundColor = .darkGray
            option1.setTitleColor(.white, for: .normal)
            Op1Tapped = true
            Op2Tapped = false
            option2.backgroundColor = .white
            option2.setTitleColor(.darkGray, for: .normal)
        }

    }
    
    
    @IBAction func O2Tapped(_ sender: Any) {
        nextQuestion()
 if(!Op1Tapped && !Op2Tapped && !Op3Tapped){
            option2.backgroundColor = .darkGray
            option2.setTitleColor(.white, for: .normal)
            Op2Tapped = true
            }
        else if (!Op1Tapped && Op3Tapped && !Op2Tapped){
            option2.backgroundColor = .darkGray
            option2.setTitleColor(.white, for: .normal)
            Op2Tapped = true
            Op3Tapped = false
            option3.backgroundColor = .white
            option3.setTitleColor(.darkGray, for: .normal)
        }
 else if(Op1Tapped){
    option2.backgroundColor = .darkGray
    option2.setTitleColor(.white, for: .normal)
    Op2Tapped = true
    Op1Tapped = false
    option1.backgroundColor = .white
    option1.setTitleColor(.darkGray, for: .normal)
 }
        else {
    option2.backgroundColor = .darkGray
    option2.setTitleColor(.white, for: .normal)
    Op2Tapped = true
        }
    }
    
    @IBAction func O3Tapped(_ sender: Any) {
        nextQuestion()
        if(!Op3Tapped){
            option1.backgroundColor = .white
            option2.backgroundColor = .white
            option1.setTitleColor(.darkGray, for: .normal)
            option2.setTitleColor(.darkGray, for: .normal)
            option3.backgroundColor = .darkGray
            option3.setTitleColor(.white, for: .normal)
            Op1Tapped = false
            Op2Tapped = false
            Op3Tapped = true
        }
    }
    
    
    func nextQuestion(){
        UIView.animate(withDuration: 1, animations: {
            self.q4.alpha = 1
        }) { (true) in
            self.showpicker()
        }
    }
    
    func showpicker(){
        UIView.animate(withDuration: 1) {
                   self.pickerview.alpha = 1
        }
    }
    
    func showNextBtn(){
        UIView.animate(withDuration: 1) {
            self.nextBrn.alpha = 1
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
