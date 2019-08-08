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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    labelCurrentValue1.text = "Both"
        box1.layer.cornerRadius = 5;
        box2.layer.cornerRadius = 5;

        
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
    

    @IBAction func sliderChanged(_ sender: Any) {
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
