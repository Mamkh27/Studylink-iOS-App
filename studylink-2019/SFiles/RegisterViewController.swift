//
//  RegisterViewController.swift
//  studylink-2019
//
//  Created by Krishna Chenna on 7/3/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerUser(_ sender: Any) {
        let email = emailTxt.text ?? ""
        let fullname = usernameTxt.text ?? ""
        let password = passwordTxt.text ?? ""
        print("Registering")
        if(fullname != "" && password != "" && email != ""){
            print("Fields are full")
            if(email.contains("@ucdavis.edu")){
                print("Davis email")
                Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
                    if(error != nil){
                        let error_desc = error?.localizedDescription ?? ""
                        self.showError(err: error_desc)
                        return
                    }
                        let userId = user?.user.uid ?? ""
                        print(userId)
                        if(userId != ""){
                            let userInfo:Dictionary = ["Fullname":fullname, "Email":email, "First": "true"]
                        Database.database().reference().child("Users/"+userId).setValue(userInfo)
                            self.showToast(controller: self, message: "Registered User", seconds: 0.5)
                            self.dismiss(animated: true, completion: nil)
                        
                        
                    }
                })
                
            } else {
                showAlert(cases: 4)
            }
            
        }
        
    }
    
    func showToast(controller: UIViewController, message: String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.green
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
            alert.dismiss(animated: true, completion: {
            })
        })
    }
    
    func showError(err: String){
        let alert = UIAlertController(title: "Error", message: err, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(cases: Int){
        var errorMsg: String = ""
        if (cases == 1) {
            errorMsg = "Please fill in all fields!"
        }
        if (cases == 2) {
            errorMsg = "Password must be six characters or more!"
        }
        if (cases == 3) {
            errorMsg = "Please enter valid email id!"
        }
        if(cases == 4){
            errorMsg = "Please enter a ucdavis.edu email!"
        }
        
        let alert = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginReturn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
