//
//  Q2ViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

enum filterMode:Float {
    case in_advance = 0.0
    case both = 5.0
    case spontaneous = 10.0
    case one_to_four = 15.0
    case four_to_eight = 20.0
    case eight_to_ten = 25.0
    case more_than_that = 30.0
}

class Q2ViewController: UIViewController {

    @IBOutlet var labelCurrentValue2: UILabel!
    @IBOutlet var labelCurrentValue1: UILabel!
    @IBOutlet var backbtn: UIButton!
    @IBOutlet var nextbtn: UIButton!
    @IBOutlet var box1: UIView!
    @IBOutlet var box2: UIView!
    @IBOutlet var advancebtn: UILabel!
    @IBOutlet var spontbtn: UILabel!
    @IBOutlet var bothbtn: UILabel!
    @IBOutlet var slider1: UISlider!
    @IBOutlet var slider2: UISlider!
    @IBOutlet var hours1: UILabel!
    @IBOutlet var hours2: UILabel!
    @IBOutlet var hours3: UILabel!
    @IBOutlet var hours4: UILabel!
    
    var slider_vals: [String: Int] = [:]
    
    var options1 = ["In Advance", "Both", "Spontaneous"]
    var options2 = ["1-4 Hrs", "4-8 Hrs", "8-10 Hrs", "11+ Hrs"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    labelCurrentValue1.text = "Both"
        box1.layer.cornerRadius = 5;
        box2.layer.cornerRadius = 5;
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)

        
        labelCurrentValue1.text = options1[1]
        labelCurrentValue2.text = options2[1]
        
        slider_vals["Q3"] = 2
        slider_vals["Q4"] = 2
        
        self.view.bringSubviewToFront(self.box1)
        self.view.bringSubviewToFront(self.box2)
        self.view.bringSubviewToFront(self.slider1)
        self.view.bringSubviewToFront(self.slider2)
        self.view.bringSubviewToFront(self.nextbtn)
        self.view.bringSubviewToFront(self.backbtn)
        self.view.bringSubviewToFront(self.spontbtn)
        self.view.bringSubviewToFront(self.bothbtn)
        self.view.bringSubviewToFront(self.advancebtn)
        self.view.bringSubviewToFront(self.labelCurrentValue1)
        self.view.bringSubviewToFront(self.labelCurrentValue2)
        self.view.bringSubviewToFront(self.hours1)
        self.view.bringSubviewToFront(self.hours2)
        self.view.bringSubviewToFront(self.hours3)
        self.view.bringSubviewToFront(self.hours4)

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        handleFilter()
    }
    

    @IBAction func sliderChanged(_ sender: UISlider) {
        let fixed = roundf((sender as AnyObject).value / 1.0) * 1.0;
        (sender as AnyObject).setValue(fixed, animated: true)
        let currentVal = Int(sender.value)
        let index = currentVal-1
        labelCurrentValue1.text = options1[index]
        slider_vals["Q3"] = currentVal
//        handleFilter()
    }
    
    
    @IBAction func slider2Changed(_ sender: UISlider) {
        let fixed = roundf((sender as AnyObject).value / 1.0) * 1.0;
        (sender as AnyObject).setValue(fixed, animated: true)
        let currentVal = Int(sender.value)
        let index = currentVal-1
        labelCurrentValue2.text = options2[index]
        slider_vals["Q4"] = currentVal
//        handleFilter()
    }
    
    
    func handleFilter(){
        guard let mode = filterMode(rawValue:  slider1.value) else{
            labelCurrentValue1.text = "Both"
            labelCurrentValue2.text = "4-8"
            return
        }
        guard let mode2 = filterMode(rawValue:  slider2.value) else{
            labelCurrentValue2.text = "4-8"
            return
        }
        

        switch mode{
        case filterMode.in_advance:
            labelCurrentValue1.text = "In Advance"
        case filterMode.both:
            labelCurrentValue1.text = "Both"
        case filterMode.spontaneous:
            labelCurrentValue1.text = "Spontaneous"
        case filterMode.one_to_four:
            labelCurrentValue2.text = "1-4 Hrs"
        case filterMode.eight_to_ten:
            labelCurrentValue2.text = "8-10 Hrs"
        case filterMode.four_to_eight:
            labelCurrentValue1.text = "4-8 Hrs"
        case filterMode.more_than_that:
            labelCurrentValue2.text = "11+ Hrs"
        }
        
        switch mode2{
        case filterMode.more_than_that:
            labelCurrentValue2.text = "11+ Hrs"
        case filterMode.one_to_four:
            labelCurrentValue2.text = "1-4 Hrs"
        case filterMode.four_to_eight:
            labelCurrentValue2.text = "4-8 Hrs"
        case filterMode.eight_to_ten:
            labelCurrentValue2.text = "8-10 Hrs"
        case filterMode.in_advance:
            labelCurrentValue1.text = "In Advance"
        case filterMode.spontaneous:
            labelCurrentValue1.text = "Spontaneous"
        case filterMode.both:
            labelCurrentValue1.text = "Both"
        }
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "Q3View") as! Q3ViewController
        vc.slider_vals = slider_vals
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
