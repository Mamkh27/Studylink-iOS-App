//
//  LogInViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/1/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn
import Alamofire

class LogInViewController: UIViewController,GIDSignInUIDelegate, GIDSignInDelegate {

    
 
    @IBOutlet var loginbtn: UIButton!
    @IBOutlet var loginBox: UIView!
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    var firstProfileSign:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        loginbtn.layer.cornerRadius = 5;
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9;
        self.view.addSubview(blurEffectView)
        self.view.bringSubviewToFront(self.loginBox)
        
        setUpGoogleSignin()
//        first = checkFirstProfile()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(Auth.auth().currentUser)
        if Auth.auth().currentUser != nil {
            let uid = Auth.auth().currentUser?.uid ?? ""
            print("UID", uid)
//            checkFirst(uid: uid)
        }

        GIDSignIn.sharedInstance().signInSilently()
//
//
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                if UserDefaults.standard.string(forKey: "uid") != nil && Auth.auth().currentUser != nil {
                    //User was already logged in
                }

                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }

        
    }
    
    func checkFirstProfile(){
        let uid = GIDSignIn.sharedInstance()?.currentUser.userID ?? ""
        Database.database().reference().child("Users").child(uid).observe(.value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary ?? [:]
            let first = value["First"] as? String ?? ""
            if(first == "true"){
                self.firstProfileSign = true
            } else {
                self.firstProfileSign = false
            }
        })
    }

    
    func setUpGoogleSignin(){
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        let signInBtn = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        signInBtn.center = CGPoint(x: view.center.x, y: view.center.y+130)
        view.addSubview(signInBtn)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser?, withError error: Error!) {
        print("Signing in")
        
        if(user != nil){
            guard let authentication = user?.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        }
        if(user != nil){
            let id = user?.userID ?? "user1"
            let first_name = user?.profile.givenName ?? ""
            let last_name = user?.profile.familyName ?? ""
            let email = user?.profile.email ?? ""
            createUser(uid: id, firstname: first_name, lastname: last_name, email: email)
        }
    }
    
    func createUser(uid:String, firstname: String, lastname: String, email: String){
        let fullname = firstname + " " + lastname
        var userInfo:Dictionary = ["Fullname":fullname, "Email":email]
        print("Create User")
        print(uid)
        if(checkEmail(email: email)){
            checkFirstGmail(uid: uid, userInfo: userInfo)
        } else {
            GIDSignIn.sharedInstance()?.signOut()
            self.showAlert(cases: 2)
        }
        
    }
    
    func loginUser(first: Bool){
        if(first){
            self.performSegue(withIdentifier: "loginFirstSegue", sender: nil)
        } else {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    func logoutUser(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        print("Logged In")
        let email = emailTxt.text ?? ""
        let password = passwordTxt.text ?? ""
        if(email.contains("@ucdavis.edu")){
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if user != nil && error == nil{
                    print("Succesful Login")
                    let uid = user?.user.uid ?? ""
                    self.checkFirst(uid: uid)
                    
                } else {
                    print("Unsuccesful Login")
                    self.showAlert(cases: 1)
                }
            })
        } else {
            self.showAlert(cases: 2)
        }
        
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        print("Sign up user")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "registerView")
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        sendReq()
        
//        let alert = UIAlertController(title: "Please enter Email!", message: "Enter your email address", preferredStyle: .alert)
//
//        alert.addTextField { (textField) in
//            textField.placeholder = "ex: user@example.com"
//        }
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//            let textField = alert?.textFields![0]
//            let email = textField?.text ?? ""
//            self.sendEmail(email_add: email)
//        }))
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
//
//        }))
//
//        // 4. Present the alert.
//        self.present(alert, animated: true, completion: nil)
    }
    
    func sendReq(){
        print("sending post")
//        guard let url = String(string: "http://localhost:3000/hello") else {
//            return
//        }
//
        let urlString = "http://localhost:3000/api/hello"
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        Alamofire.request(urlRequest)
            .responseJSON { response in
                
            print(response)
        }
    

    }
    
    
    
    func sendEmail(email_add: String){
        Auth.auth().sendPasswordReset(withEmail: email_add, completion: { error in
            if(error != nil){
                print(error?.localizedDescription)
                let alert = UIAlertController(title: "Please enter valid email!", message: "This user does not exist.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                    
                }))
                self.present(alert, animated: true, completion: nil)
                return
            }
            print("Email sent")
            
        })
    }
    
    func checkFirst(uid: String){
        print("Check First")
        Database.database().reference().child("Users").observe(.value, with: {(snapshot) in
            if(snapshot.hasChild(uid)){
                self.loginUser(first: false)
            } else {
                self.loginUser(first: true)
            }
        })
    }
    
    func checkFirstGmail(uid: String, userInfo: [String: String]){
        print("Check First")
        Database.database().reference().child("Users").observe(.value, with: {(snapshot) in
            if(snapshot.hasChild(uid)){
                self.loginUser(first: false)
            } else {
                Database.database().reference().child("Users").child(uid).setValue(userInfo)
                self.loginUser(first: true)
            }
        })
        
    }
    
    func showToast(controller: UIViewController, message: String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.green
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds, execute: {
            alert.dismiss(animated: true, completion: {
                self.navigationController?.popToRootViewController(animated: true)
            })
        })
    }
    
    func showAlert(cases: Int){
        var errorMsg: String = ""
        if (cases == 1) {
            errorMsg = "Invalid login credentials! Please Re-enter your username and password!"
        } else if(cases == 2){
            errorMsg = "Invalid login credentials! Please enter a ucdavis.edu email"
        }
        
        let alert = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkEmail(email:String) -> Bool{
        if(email.contains("@ucdavis.edu")){
            return true
        }
        return false
    }
}
