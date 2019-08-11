//
//  PageTwoViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/11/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var q2: UIImageView!
    @IBOutlet var pickerview2: UIPickerView!
    @IBOutlet var q1: UIImageView!
    @IBOutlet var pickerview: UIPickerView!
    let options = ["1","2","3","4","5","6","7","8","9","10"]
    var firstPickerDone = false
    var secondPickerDone = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextBtn.alpha = 0
        self.pickerview.alpha = 0
        self.q1.alpha = 0
        self.q2.alpha = 0
        self.pickerview2.alpha = 0
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, animations: {
            self.q1.alpha = 1
        }) { (true) in
            self.showpicker()
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (firstPickerDone && !secondPickerDone){
        print("User chose ")
        print(options[row])
        shownextQuestion()
        }
        if (secondPickerDone){
            showNextBtn()
        }
    }

    func shownextQuestion(){
        UIView.animate(withDuration: 1, animations: {
            self.q2.alpha = 1
        }) { (true) in
            self.showpicker2()
            
        }
    }
    func showpicker2(){
        UIView.animate(withDuration: 1) {
            self.pickerview2.alpha = 1
            self.secondPickerDone = true
        }
    }


    func showpicker(){
        UIView.animate(withDuration: 1) {
            self.pickerview.alpha = 1
            self.firstPickerDone  = true
        }
    }

    func showNextBtn(){
        UIView.animate(withDuration: 1) {
            self.nextBtn.alpha = 1
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
