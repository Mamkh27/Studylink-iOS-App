//
//  Q3ViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

enum FilteringMode:Float {
    case two_to_three = 0.0
    case three_to_five = 5.0
    case five_to_seven = 10.0
    case one_three = 15.0
    case three_five = 20.0
    case five_seven = 25.0
}

class Q3ViewController: UIViewController {

    @IBOutlet var box1: UIView!
    @IBOutlet var box2: UIView!
    @IBOutlet var slider1: UISlider!
    @IBOutlet var slider2: UISlider!
    @IBOutlet var nextbtn: UIButton!
    @IBOutlet var labelCurrentValue2: UILabel!
    @IBOutlet var labelCurrentValue1: UILabel!
    @IBOutlet var backbtn: UIButton!
//filters
    @IBOutlet var one: UILabel!
    @IBOutlet var two: UILabel!
    @IBOutlet var three: UILabel!
    @IBOutlet var four: UILabel!
    @IBOutlet var five: UILabel!
    @IBOutlet var six: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCurrentValue1.text = "3-5"
        labelCurrentValue2.text = "3-5"
        
        box1.layer.cornerRadius = 5;
        box2.layer.cornerRadius = 5;
        
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
        self.view.bringSubviewToFront(self.backbtn)
    self.view.bringSubviewToFront(self.labelCurrentValue1)
    self.view.bringSubviewToFront(self.labelCurrentValue2)
        
        self.view.bringSubviewToFront(self.one)
        self.view.bringSubviewToFront(self.two)
        self.view.bringSubviewToFront(self.three)
        self.view.bringSubviewToFront(self.four)
        self.view.bringSubviewToFront(self.five)
        self.view.bringSubviewToFront(self.six)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        handleFilter()
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        //Restrict slider to fixed value
        let fixed = roundf((sender as AnyObject).value / 5.0) * 5.0;
        (sender as AnyObject).setValue(fixed, animated: true)
        
        handleFilter()
    }
    
    @IBAction func slider2Changed(_ sender: Any) {
        let fixed = roundf((sender as AnyObject).value / 5.0) * 5.0;
        (sender as AnyObject).setValue(fixed, animated: true)
        
        handleFilter()
    }
    
    
    func handleFilter(){
        guard let mode = FilteringMode(rawValue: slider1.value) else{
            labelCurrentValue1.text = "3-5"
            labelCurrentValue2.text = "3-5"
            return
        }
        guard let mode2 = FilteringMode(rawValue: slider2.value) else{
            labelCurrentValue2.text = "3-5"
            return
        }
        
        
        switch mode{
        case FilteringMode.two_to_three:
            labelCurrentValue1.text = "2-3"
        case FilteringMode.three_to_five:
            labelCurrentValue1.text = "3-5"
        case FilteringMode.five_to_seven:
            labelCurrentValue1.text = "5-7"
        case FilteringMode.one_three:
            labelCurrentValue2.text = "1-3"
        case FilteringMode.three_five:
            labelCurrentValue2.text = "3-5"
        case FilteringMode.five_seven:
            labelCurrentValue2.text = "5-7"
        }
        
        switch mode2{
        case FilteringMode.one_three:
            labelCurrentValue2.text = "1-3"
        case FilteringMode.three_five:
            labelCurrentValue2.text = "3-5"
        case FilteringMode.five_seven:
            labelCurrentValue2.text = "5-7"
        case FilteringMode.two_to_three:
            labelCurrentValue1.text = "2-3"
        case FilteringMode.three_to_five:
            labelCurrentValue1.text = "3-5"
        case FilteringMode.five_to_seven:
            labelCurrentValue1.text = "5-7"
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
