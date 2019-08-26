//
//  Q3ViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
import Alamofire
import FirebaseAuth
import GoogleSignIn

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
    
    var slider_vals: [String: Int] = [:]
    let options1 = ["2-3", "3-5","5-7"]
    let options2 = ["1-3", "3-5","5-7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        box1.layer.cornerRadius = 5;
        box2.layer.cornerRadius = 5;
        
        slider_vals["Q5"] = 2
        slider_vals["Q6"] = 2
        
        labelCurrentValue1.text = options1[1]
        labelCurrentValue2.text = options2[1]
        
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
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //Restrict slider to fixed value
        let fixed = roundf((sender as AnyObject).value / 1.0) * 1.0;
        (sender as AnyObject).setValue(fixed, animated: true)
        let currentVal = Int(sender.value)
        let index = currentVal-1
        slider_vals["Q5"] = currentVal
        labelCurrentValue1.text = options1[index]
//        handleFilter()
    }
    
    @IBAction func slider2Changed(_ sender: UISlider) {
        let fixed = roundf((sender as AnyObject).value / 1.0) * 1.0;
        (sender as AnyObject).setValue(fixed, animated: true)
        let currentVal = Int(sender.value)
        let index = currentVal-1
        slider_vals["Q6"] = currentVal
        labelCurrentValue2.text = options2[index]
//        handleFilter()
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
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func confirmPreferences(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm Preferences?", message: "Pressing OK would confirm the selected preferences.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in
            print(self.slider_vals)
            self.sendPreferences()
            let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "badgeView") as! BadgeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func sendPreferences(){
        var user_vals: [String: String] = slider_vals.mapValues{String($0)}
        var uid = Auth.auth().currentUser?.uid
        if(uid == nil){
            uid = GIDSignIn.sharedInstance()?.currentUser.userID
        }
//        let uid = "7500"
        user_vals["uid"] = uid ?? "100003"
        
        print(user_vals)
        let session = URLSession.shared
        let url = URL(string: "http://localhost:3002/api/createUser")!


        var url_request = URLRequest(url: url)
        url_request.httpMethod = "POST"

        url_request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        url_request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")

        let json = try! JSONSerialization.data(withJSONObject: user_vals, options: [])

        let task = session.uploadTask(with: url_request, from: json) { data, response, error in
            print("Send POST Request")
            print(data ?? 0)
        }
        task.resume()
    }
    
}
