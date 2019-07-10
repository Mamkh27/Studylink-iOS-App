//
//  ViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 4/16/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        // set the text from the data model
        cell.textLabel?.text = classes[indexPath.row]
        
        return cell
    }
    


   
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cambox: UIImageView!

    @IBAction func selectmenu(_ sender: Any) {
    }
    @IBAction func editprofile(_ sender: Any) {
    }
    @IBAction func cambox(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var majorLbl: UILabel!
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var classesTable: UITableView!
    var userId:String = ""
    var classes:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0).cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        
        
        cambox.layer.borderWidth = 1
        cambox.layer.masksToBounds = false
        cambox.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0).cgColor
        cambox.layer.cornerRadius = cambox.frame.height/2
        cambox.clipsToBounds = true

        userId = "user1"
        userId = GIDSignIn.sharedInstance()?.currentUser.userID ?? "user1"
        retrieveData()
        classesTable.delegate = self
        classesTable.dataSource = self
        
        print(GIDSignIn.sharedInstance()?.currentUser.userID)
        
    }
    
    @IBAction func setProfilePicture(_ sender: Any) {
        
    }
    @IBAction func menuBtn(_ sender: Any) {
        var errorMsg: String = ""
        errorMsg = "Are you sure you would like to logout?"
        
        let alert = UIAlertController(title: "Logging out?", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { action in
            self.logoutUser()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func logoutUser(){
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logoutUser", sender: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        GIDSignIn.sharedInstance()?.signOut()
    }
    
    func retrieveData(){
        Database.database().reference().child("Users").child(userId).observe(.value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.yearLbl.text = value?["Year"] as? String ?? ""
            self.bioLbl.text = value?["Bio"] as? String ?? ""
            self.majorLbl.text = value?["Major"] as? String ?? ""
            let classesVal = snapshot.childSnapshot(forPath: "Classes").value as? NSDictionary
            
            self.classes = classesVal?.allValues as? [String] ?? []
            self.classesTable.reloadData()
        })
    }


}

