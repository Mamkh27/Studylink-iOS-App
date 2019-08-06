//
//  QViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

enum FilterMode:Float {
    case indepedent = 0.0
    case both = 5.0
    case interactive = 10.0
    case listener = 15.0
    case both2 = 20.0
    case leader = 25.0
}


class QViewController: UIViewController {

    
    
    
    @IBOutlet var bothbtn2: UILabel!
    @IBOutlet var listenerbtn: UILabel!
    @IBOutlet var leaderbtn: UILabel!
    @IBOutlet var indepbtn: UILabel!
    @IBOutlet var bothbtn: UILabel!
    @IBOutlet var inter: UILabel!
    @IBOutlet var box1: UIView!
    @IBOutlet var box2: UIView!
    @IBOutlet var slider1: UISlider!
    @IBOutlet var slider2: UISlider!
    @IBOutlet var nextbtn: UIButton!
    @IBOutlet var labelCurrentValue1: UILabel!
    @IBOutlet var labelCurrentValue2: UILabel!
    
    var slider_vals = [
        "Q1": 2,
        "Q2": 2
    ]
    
    var options1 = ["Independent", "Both", "Interactive"]
    var options2 = ["Listener", "Both", "Leader"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        box1.layer.cornerRadius = 5;
        box2.layer.cornerRadius = 5;
        
        
        labelCurrentValue1.text = options1[1]
        labelCurrentValue2.text = options2[2]
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)
        
        self.view.bringSubviewToFront(self.box1)
        self.view.bringSubviewToFront(self.box2)
        self.view.bringSubviewToFront(self.slider1)
        self.view.bringSubviewToFront(self.slider2)
        self.view.bringSubviewToFront(self.nextbtn)
        self.view.bringSubviewToFront(self.labelCurrentValue1)
        self.view.bringSubviewToFront(self.inter)
        self.view.bringSubviewToFront(self.indepbtn)
        self.view.bringSubviewToFront(self.bothbtn)
        self.view.bringSubviewToFront(self.leaderbtn)
        self.view.bringSubviewToFront(self.listenerbtn)
        self.view.bringSubviewToFront(self.bothbtn2)
        self.view.bringSubviewToFront(self.labelCurrentValue2)
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        handleFilter()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //Restrict slider to fixed value
        let fixed = roundf((sender as AnyObject).value / 1.0) * 1.0;
        (sender as AnyObject).setValue(fixed, animated: true)
        let currentVal = Int(sender.value)
        print(currentVal)
        let index = currentVal-1
        labelCurrentValue1.text = options1[index]
        slider_vals["Q1"] = currentVal
//        handleFilter()
    }
    
    @IBAction func slider2Changed(_ sender: UISlider) {
        let fixed = roundf((sender as AnyObject).value / 1.0) * 1.0;
        (sender as AnyObject).setValue(fixed, animated: true)
        let currentVal = Int(sender.value)
        let index = currentVal-1
        labelCurrentValue2.text = options2[index]
        slider_vals["Q2"] = currentVal
//        handleFilter()
    }
    
    
    func handleFilter(){
        guard let mode = FilterMode(rawValue: slider1.value) else{
            labelCurrentValue1.text = "Both"
            return
        }
        guard let mode2 = FilterMode(rawValue: slider2.value) else{
            labelCurrentValue2.text = "Both"
            return
        }

        
        switch mode{
        case FilterMode.indepedent:
            labelCurrentValue1.text = "Independent"
        case FilterMode.both:
            labelCurrentValue1.text = "Both"
        case FilterMode.interactive:
            labelCurrentValue1.text = "Interactive"
        case FilterMode.listener:
            labelCurrentValue2.text = "Listener"
        case FilterMode.leader:
            labelCurrentValue2.text = "Leader"
        case .both2:
         labelCurrentValue1.text = "Both"
        }
        
        switch mode2{
        case FilterMode.both2:
            labelCurrentValue2.text = "Both"
        case FilterMode.listener:
            labelCurrentValue2.text = "Listener"
        case FilterMode.leader:
            labelCurrentValue2.text = "Leader"
        case .indepedent:
            labelCurrentValue1.text = "Independent"
        case .interactive:
            labelCurrentValue1.text = "Interactive"
        case .both:
            labelCurrentValue1.text = "Both"
        }
        
    }
    
    func setPreferencesVal(){
        
        switch labelCurrentValue1.text {
        case "Independent":
            slider_vals["Q1"] = 1
        case "Both":
            slider_vals["Q1"] = 2
        case "Interactive":
            slider_vals["Q1"] = 3
        default:
            slider_vals["Q1"] = 0
        }
        
        switch labelCurrentValue2.text {
        case "Independent":
            slider_vals["Q2"] = 1
        case "Both":
            slider_vals["Q2"] = 2
        case "Interactive":
            slider_vals["Q2"] = 3
        default:
            slider_vals["Q2"] = 0
        }
    }

    
    @IBAction func nextBtn(_ sender: Any) {
        print(slider_vals)
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "Q2View") as! Q2ViewController
        vc.slider_vals = slider_vals
        self.navigationController?.pushViewController(vc, animated: true)
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
