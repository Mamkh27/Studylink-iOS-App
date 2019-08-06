//
//  MenuOptions.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class MenuOptions:  CalendarView{
    
    let Cell = "Cell"
    //profile variables
var fltrOneLbl = UILabel()
var fltrTwoLbl = UILabel()
var fltrThreeLbl = UILabel()
var fltrFourLbl = UILabel()
var fltrFiveLbl = UILabel()
var bioLbl = UILabel()


var calendar = CalendarView()

//mutual variables
var mutualTitle = UILabel()
var classOneLbl = UILabel()
var classTwoLbl = UILabel()
var classThreeLbl = UILabel()
var classFourLbl = UILabel()
var classFiveLbl = UILabel()
var ProfOneLbl = UILabel()
var ProfTwoLbl = UILabel()
var ProfThreeLbl = UILabel()
var ProfFourLbl = UILabel()
var ProfFiveLbl = UILabel()

    

    
    lazy var collectionViewOptions: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red:5/255, green: 121/255, blue: 171/255, alpha: 1.0)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Cell)
        cv.alpha = 1.0
        cv.dataSource = self
        cv.delegate = self
        cv.contentInset = UIEdgeInsets(top: 50,left: 0,bottom: 0,right: 0)
        cv.scrollIndicatorInsets = UIEdgeInsets(top: 50,left: 0,bottom: 0,right: 0)
        return cv
    }()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell, for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        displayProfile()
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isRed(){
        return (backgroundColor = .red)
    }
    func isWhite(){
        return (backgroundColor = .white)
    }
    func isBlue(){
        return (backgroundColor = .blue)
    }

    func displayProfile(){
        setUpFilters()
        setUpBio()
        
    }
    
    func displayCalendar(){
        backgroundColor = .darkGray
calendar.initializeView()
    }
    
    func displayMutuals(){
        mutualTitle.isHidden = false
        setUpTitle()
        setUpClasses()
    }
    
    func setUpClasses(){
        /*
 var classOneLbl = UILabel()
 var classTwoLbl = UILabel()
 var classThreeLbl = UILabel()
 var classFourLbl = UILabel()
 var classFiveLbl = UILabel()
 var ProfOneLbl = UILabel()
 var ProfTwoLbl = UILabel()
 var ProfThreeLbl = UILabel()
 var ProfFourLbl = UILabel()
 var ProfFiveLbl = UILabel()
 */
        classOneLbl.isHidden = false
        classTwoLbl.isHidden = false
        classThreeLbl.isHidden = false
        classFourLbl.isHidden = false
        classFiveLbl.isHidden = false
        ProfOneLbl.isHidden = false
        ProfTwoLbl.isHidden = false
        ProfThreeLbl.isHidden = false
        ProfFourLbl.isHidden = false
        ProfFiveLbl.isHidden = false
        
        classOneLbl.frame = CGRect(x: 65, y: 10, width: 100, height: 100)
        classTwoLbl.frame = CGRect(x: 65, y:40, width: 100, height: 100)
        classThreeLbl.frame = CGRect(x: 65, y:70, width: 100, height: 100)
        classFourLbl.frame = CGRect(x: 65, y: 100, width: 100, height: 100)
        classFiveLbl.frame = CGRect(x: 65, y: 130, width: 100, height: 100)
        ProfOneLbl.frame = CGRect(x: 185, y: 10, width: 100, height: 100)
        ProfTwoLbl.frame = CGRect(x: 185, y: 40, width: 100, height: 100)
        ProfThreeLbl.frame = CGRect(x: 185, y:70, width: 100, height: 100)
        ProfFourLbl.frame = CGRect(x: 185, y: 100, width: 100, height: 100)
        ProfFiveLbl.frame = CGRect(x: 185, y: 130, width: 100, height: 100)
        
        classOneLbl.text = "ECS 30"
        classTwoLbl.text = "PHY 9A"
        classThreeLbl.text = "MAT 21B"
        classFourLbl.text = "BIS 2A"
        classFiveLbl.text = "FMS 10"
        ProfOneLbl.text = "BUTNER"
        ProfTwoLbl.text = "ROESSLER"
        ProfThreeLbl.text = "LEE"
        ProfFourLbl.text = "GEORGE"
        ProfFiveLbl.text = "KASEY"
        
        classOneLbl.textAlignment = .center
        classTwoLbl.textAlignment = .center
        classThreeLbl.textAlignment = .center
        classFourLbl.textAlignment = .center
        classFiveLbl.textAlignment = .center
        ProfOneLbl.textAlignment = .center
        ProfTwoLbl.textAlignment = .center
        ProfThreeLbl.textAlignment = .center
        ProfFourLbl.textAlignment = .center
        ProfFiveLbl.textAlignment = .center
        
        classOneLbl.textColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        classTwoLbl.textColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        classThreeLbl.textColor = .gray
        classFourLbl.textColor = .gray
        classFiveLbl.textColor = .gray
        ProfOneLbl.textColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        ProfTwoLbl.textColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        ProfThreeLbl.textColor = .gray
        ProfFourLbl.textColor = .gray
        ProfFiveLbl.textColor = .gray
        
        
        classOneLbl.font = UIFont(name: "Avenir", size: 14)
        classTwoLbl.font = UIFont(name: "Avenir", size: 14)
        classThreeLbl.font = UIFont(name: "Avenir", size: 14)
        classFourLbl.font = UIFont(name: "Avenir", size: 14)
        classFiveLbl.font = UIFont(name: "Avenir", size: 14)
        ProfOneLbl.font = UIFont(name: "Avenir", size: 14)
        ProfTwoLbl.font = UIFont(name: "Avenir", size: 14)
        ProfThreeLbl.font = UIFont(name: "Avenir", size: 14)
        ProfFourLbl.font = UIFont(name: "Avenir", size: 14)
        ProfFiveLbl.font = UIFont(name: "Avenir", size: 14)
        
        addSubview(classThreeLbl)
        addSubview(classFourLbl)
        addSubview(classFiveLbl)
        addSubview(classTwoLbl)
        addSubview(classOneLbl)

        addSubview(ProfThreeLbl)
        addSubview(ProfFourLbl)
        addSubview(ProfFiveLbl)
        addSubview(ProfTwoLbl)
        addSubview(ProfOneLbl)

    }
    
    func hideCalendar(){
calendar.hidecalendar()
   backgroundColor = .white
    }
    
    func hideProfile(){
        hideFilters()
        hideBio()
    }
    
    func hideFilters(){
        fltrOneLbl.isHidden = true
        fltrTwoLbl.isHidden = true
        fltrThreeLbl.isHidden = true
        fltrFourLbl.isHidden = true
        fltrFiveLbl.isHidden = true
    }
    
    func setUpFilters(){
        fltrOneLbl.isHidden = false
        fltrTwoLbl.isHidden = false
        fltrThreeLbl.isHidden = false
        fltrFourLbl.isHidden = false
        fltrFiveLbl.isHidden = false
        
        fltrOneLbl.frame = CGRect(x: 40, y: -45, width: 100, height: 100)
        fltrTwoLbl.frame = CGRect(x: 140, y: -45, width: 100, height: 100)
        fltrThreeLbl.frame = CGRect(x: 240, y: -45, width: 100, height: 100)
        fltrFourLbl.frame = CGRect(x: 90, y: -25, width: 100, height: 100)
        fltrFiveLbl.frame = CGRect(x: 190, y: -25, width: 100, height: 100)
        
        fltrOneLbl.text = "ECS 30"
        fltrTwoLbl.text = "PHY 9A"
        fltrThreeLbl.text = "MAT 21B"
        fltrFourLbl.text = "COMP SCI"
        fltrFiveLbl.text = "FILTER 5"
        
        fltrOneLbl.textAlignment = .center
        fltrTwoLbl.textAlignment = .center
        fltrThreeLbl.textAlignment = .center
        fltrFourLbl.textAlignment = .center
        fltrFiveLbl.textAlignment = .center
        
        fltrOneLbl.textColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        fltrTwoLbl.textColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        fltrThreeLbl.textColor = .gray
        fltrFourLbl.textColor = .gray
        fltrFiveLbl.textColor = .gray
        
        
        fltrOneLbl.font = UIFont(name: "Avenir", size: 14)
        fltrTwoLbl.font = UIFont(name: "Avenir", size: 14)
        fltrThreeLbl.font = UIFont(name: "Avenir", size: 14)
        fltrFourLbl.font = UIFont(name: "Avenir", size: 14)
        fltrFiveLbl.font = UIFont(name: "Avenir", size: 14)
        
        addSubview(fltrThreeLbl)
        addSubview(fltrFourLbl)
        addSubview(fltrFiveLbl)
        addSubview(fltrTwoLbl)
        addSubview(fltrOneLbl)
        addSubview(calendar.myCollectionView)
        addSubview(calendar)
    
    }
    func setUpBio(){
        bioLbl.isHidden = false
        bioLbl.frame = CGRect(x:15, y:80, width: frame.width , height: 100)
        bioLbl.text = "I just wanna pass this quarter man. It's too cold for this ): | Specifically looking for a lab partner for Tuesday's Physics with Roessler"
        bioLbl.padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 12)
        bioLbl.textAlignment = .center
        bioLbl.textColor = .darkGray
        bioLbl.font = UIFont(name: "Avenir", size: 18)

        bioLbl.lineBreakMode = .byWordWrapping
        bioLbl.sizeToFit()
        bioLbl.lineBreakMode = .byTruncatingMiddle
        bioLbl.adjustsFontSizeToFitWidth = true
        bioLbl.numberOfLines = 0
        bioLbl.setLineSpacing(lineSpacing: 2.0)
        addSubview(bioLbl)
        
        
    
    }
    
    func setUpTitle(){
        self.mutualTitle.text = "You are both currently taking: "
        mutualTitle.font = UIFont(name: "Avenir", size: 16 )
        mutualTitle.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        mutualTitle.textAlignment = .center
        mutualTitle.tintColor = .darkGray
        addSubview(mutualTitle)
        mutualTitle.frame = CGRect(x:0, y:-25, width: frame.width , height: 100)
    }
    
    func hideBio(){
        bioLbl.isHidden = true
    }
    

    
    func  hideMutuals(){
        mutualTitle.isHidden = true
        ProfOneLbl.isHidden = true
        ProfTwoLbl.isHidden = true
        ProfThreeLbl.isHidden = true
        ProfFourLbl.isHidden = true
        ProfFiveLbl.isHidden = true
        classOneLbl.isHidden = true
        classTwoLbl.isHidden = true
        classThreeLbl.isHidden = true
        classFourLbl.isHidden = true
        classFiveLbl.isHidden = true
        
    }
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
    }
}
