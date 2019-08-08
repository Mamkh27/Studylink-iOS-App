//
//  NewInfoViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 4/16/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn

class NewInfoViewController: UIViewController {

    @IBOutlet var nextbtn: UIButton!
    @IBOutlet weak var majorTxt: UITextField!
    @IBOutlet weak var yearTxt: UITextField!
    @IBOutlet weak var bioTxt: UITextView!
    @IBOutlet weak var class1Txt: UITextField!
    @IBOutlet weak var class2Txt: UITextField!
    @IBOutlet weak var class3Txt: UITextField!
    @IBOutlet weak var class4Txt: UITextField!
    @IBOutlet weak var class5Txt: UITextField!
    
    @IBOutlet var classes: UIImageView!
    @IBOutlet var major: UIImageView!
    @IBOutlet var bio: UIImageView!
    @IBOutlet var gradyear: UIImageView!
    var firebaseRef: DatabaseReference!
    var userId: String = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseRef = Database.database().reference()
        userId = Auth.auth().currentUser?.uid ?? "user1"
        if(userId == "user1"){
            userId = GIDSignIn.sharedInstance()?.currentUser.userID ?? "user1"
        }
        print("UserID", userId)
        preloadTextViews()
        
 

        self.view.bringSubviewToFront(self.majorTxt)
        self.view.bringSubviewToFront(self.yearTxt)
        self.view.bringSubviewToFront(self.class1Txt)
        self.view.bringSubviewToFront(self.class2Txt)
        self.view.bringSubviewToFront(self.class3Txt)
        self.view.bringSubviewToFront(self.class4Txt)
        self.view.bringSubviewToFront(self.class5Txt)
        self.view.bringSubviewToFront(self.bioTxt)

        self.view.bringSubviewToFront(self.classes)
        self.view.bringSubviewToFront(self.major)
        self.view.bringSubviewToFront(self.bio)
        self.view.bringSubviewToFront(self.gradyear)
        self.view.bringSubviewToFront(self.nextbtn)
        
        

        
    }

    
    func preloadTextViews(){
        firebaseRef.child("Users").child(userId).observe(.value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.majorTxt.text = value?["Major"] as? String ?? ""
            self.bioTxt.text = "Bio: " + (value?["Bio"] as? String ?? "")
            self.yearTxt.text = value?["Year"] as? String ?? ""
            
            let classesVal = snapshot.childSnapshot(forPath: "Classes").value as? NSDictionary
            let classes = classesVal?.allValues as? [String] ?? []
            
            if (classes.indices.contains(0)){
                self.class1Txt.text = classes[0]
            }
            if (classes.indices.contains(1)){
                self.class2Txt.text = classes[1]
            }
            
            if (classes.indices.contains(2)){
                self.class3Txt.text = classes[2]
            }
            
            if (classes.indices.contains(3)){
                self.class4Txt.text = classes[3]
            }
            
            if (classes.indices.contains(4)){
                self.class5Txt.text = classes[4]
            }
        })
    }
    
    func checkStr(string: String) -> Bool {
        if(string != ""){
            return true
        }
        return false
    }
    
    func setMajor(){
        let major = majorTxt.text ?? ""
        if(checkStr(string: major)){
            firebaseRef.child("Users").child(userId).child("Major").setValue(major)
        }
    }
    
    func setYear(){
        let year = yearTxt.text ?? ""
        if(checkStr(string: year)){
            firebaseRef.child("Users").child(userId).child("Year").setValue(year)
        }
    }
    
    func setClasses(){
        let class1 = class1Txt.text ?? ""
        let class2 = class2Txt.text ?? ""
        let class3 = class3Txt.text ?? ""
        let class4 = class4Txt.text ?? ""
        let class5 = class5Txt.text ?? ""
        
        firebaseRef.child("Users").child(userId).child("Classes").removeValue()
        
        if(checkStr(string: class1)){
            firebaseRef.child("Users").child(userId).child("Classes").child("Class1").setValue(class1)
        }
        if(checkStr(string: class2)){
            firebaseRef.child("Users").child(userId).child("Classes").child("Class2").setValue(class2)
        }
        if(checkStr(string: class3)){
            firebaseRef.child("Users").child(userId).child("Classes").child("Class3").setValue(class3)
        }
        if(checkStr(string: class4)){
            firebaseRef.child("Users").child(userId).child("Classes").child("Class4").setValue(class4)
        }
        if(checkStr(string: class5)){
            firebaseRef.child("Users").child(userId).child("Classes").child("Class5").setValue(class5)
        }
    }
    
    func setBio(){
        var bio = bioTxt.text ?? ""
        bio.removeFirst(4)
        
        if(checkStr(string: bio)){
            firebaseRef.child("Users").child(userId).child("Bio").setValue(bio)
        }
    }

    @IBAction func continueBtn(_ sender: Any) {
        setMajor()
        setBio()
        setYear()
        setClasses()
        self.dismiss(animated: true, completion: nil)
    }

}
