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
import FirebaseStorage
import GoogleSignIn

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var topview: UIView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        // set the text from the data model
        cell.textLabel?.text = classes[indexPath.row]
        
        return cell
    }
    


    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var cambox: UIImageView!
    @IBAction func selectmenu(_ sender: Any) {
    }
    @IBAction func editprofile(_ sender: Any) {
    }
    @IBAction func cambox(_ sender: UIButton) {
    }
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view4: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var mainview: UIView!
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var outerview: UIView!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var majorLbl: UILabel!
    @IBOutlet var backgroundImg: UIImageView!
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var classesTable: UITableView!
    var userId:String = ""
    var classes:[String] = []
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var lastnameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.cornerRadius = 5;
        view2.layer.cornerRadius = 5;
        view3.layer.cornerRadius = 5;
        view4.layer.cornerRadius = 5;
        self.navigationController?.isNavigationBarHidden = true

        
        profileImg.layer.borderWidth = 1
        profileImg.layer.masksToBounds = false
        profileImg.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0).cgColor
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.clipsToBounds = true
        
        setNames()
 
        
        
        cambox.layer.borderWidth = 1
        cambox.layer.masksToBounds = false
        cambox.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0).cgColor
        cambox.layer.cornerRadius = cambox.frame.height/2
        cambox.clipsToBounds = true

        userId = "user1"
        userId = GIDSignIn.sharedInstance()?.currentUser.userID ?? "user1"
        if userId == "user1" {
            userId = Auth.auth().currentUser?.uid ?? "user_id"
        }
        
        let queue = DispatchQueue(label: "user-data-queue")
        queue.async {
            self.retrieveData()
            
            
        }
        
        
//        getProfilePicture()
        classesTable.delegate = self
        classesTable.dataSource = self
        
        print(GIDSignIn.sharedInstance()?.currentUser.userID)
        
    }

    func addContraintsWithFormat(_ format: String, views: UIView...) {
        var viewDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDict[key] = view
        }
        
       view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
    }
    
    func setNames(){
        let user = GIDSignIn.sharedInstance()?.currentUser.profile
        let first_name = user?.givenName ?? ""
        let last_name = user?.familyName ?? ""
        firstLbl.text = first_name
        lastnameLbl.text = last_name
    }
    
    func getProfilePicture(){
        Database.database().reference().child("Users").child(userId).observe(.value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary ?? [:]
            let url = value["Profile_pic"] as? String
            if let new_url = url {
                self.displayImage(url: new_url)
            } else {
                print("Couldn't find new URL")
            }
        })
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
            let url = value?["Profile_pic"] as? String
            if let new_url = url {
                self.displayImage(url: new_url)
            } else {
                print("Couldn't find new URL")
            }
            let classesVal = snapshot.childSnapshot(forPath: "Classes").value as? NSDictionary
            
            self.classes = classesVal?.allValues as? [String] ?? []
            self.classesTable.reloadData()
        })
    }
    
    @IBAction func setProfilePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image received")
        var selectedImage:UIImage?
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selectedImage = editedImage
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectedImage = image
        }
        if let img = selectedImage {
            storeImage(image: img)
            showImage(image: img)
        }
        
        dismiss(animated:true, completion: nil)
    }

    
    func storeImage(image: UIImage){
        print("Storing Image")
        var uid = Auth.auth().currentUser?.uid ?? "None"
        if(uid == "None"){
            uid = GIDSignIn.sharedInstance()?.currentUser.userID ?? "nil"
        }
        if(uid == "nil"){
            return
        }
        
        
        let storage = Storage.storage(url:"gs://study-link-6bead.appspot.com")
        let storageRef = storage.reference()
        let profileRef = storageRef.child("Users/" + uid + "/profile_picture.jpg")
        if let uploadTask = image.pngData(){
            
            profileRef.putData(uploadTask, metadata: nil) { (metadata, error) in
                print("Putting Data")
                if error != nil {
                    print(error?.localizedDescription ?? "error")
                }
                print(metadata)
                self.storeURL(uid: uid, ref: profileRef)
            }
        } else {
            print("scam")
        }
        
    }
    
    func storeURL(uid: String, ref:StorageReference){
        ref.downloadURL(completion: { (url, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
                return
            }
            let new_url = url?.absoluteString ?? "url"
            if(new_url != "url"){
                self.saveImg(url: new_url, uid: uid)
            } else {
                self.showErrAlert(case_val: 1)
            }
            
        })
    }
    
    func showErrAlert(case_val: Int){
        if(case_val == 1){
            let errorMsg = "Please try again!"
            let alert = UIAlertController(title: "Image Could not be Saved!", message: errorMsg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func saveImg(url: String, uid: String){
        let db_ref = Database.database().reference().child("Users").child(uid).child("Profile_pic")
        db_ref.setValue(url)
    }
    
    func showImage(image: UIImage){
        profileImg.image = image
    }
    
    func displayImage(url: String){
        let storageRef = Storage.storage().reference(forURL: url)
        
        storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if let error = error {
                print(error)
            } else {
                print(data!)
                print("done")
                DispatchQueue.main.async {
                    let image = UIImage(data: data!)
                    self.profileImg.image = image
                }
            }
        }
    }
    
    
    /*
     
     //CODER'S NOTE: This is just me getting used to Bezier tools for vector shapes, ignore.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
        
        let demoView = curvedView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                              y: self.view.frame.size.height/2 - height/2,
                                              width: width,
                                              height: height))
        
        self.view.addSubview(demoView)
    }
*/
}

