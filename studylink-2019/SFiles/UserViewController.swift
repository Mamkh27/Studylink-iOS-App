//
//  ViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 4/16/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    


   
    @IBOutlet weak var image: UIImageView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.cornerRadius = 5;
        view2.layer.cornerRadius = 5;
        view3.layer.cornerRadius = 5;
        view4.layer.cornerRadius = 5;


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
        
        retrieveData()
        classesTable.delegate = self
        classesTable.dataSource = self
    }
    

    @IBAction func setProfilePicture(_ sender: Any) {
        
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

