//
//  MenuOptions.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class MenuOptions:  UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var monthcount = 0
    var monthsArr = ["January","February","March","April","May","June","July","August","September","October", "November", "December"]
    var currentMonthIndex = 0
    var currentYear: Int = 0
    
    var numOfDaysInMonth = [31, 28, 31, 30, 31, 30,31, 31,30, 31,30,31]
 
    var alreadyDisplayed = false
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0

    let myStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = true
   
        return stackView
    }()
    
    
    let Cell = "Cell"
    //profile variables
var fltrOneLbl = UILabel()
var fltrTwoLbl = UILabel()
var fltrThreeLbl = UILabel()
var fltrFourLbl = UILabel()
var fltrFiveLbl = UILabel()
var bioLbl = UILabel()




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

    

    
    let myCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()

        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 0
    let myCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    myCollectionView.showsHorizontalScrollIndicator = false
    myCollectionView.translatesAutoresizingMaskIntoConstraints = true
    
    myCollectionView.backgroundColor = UIColor.clear
    myCollectionView.allowsMultipleSelection = false
    return myCollectionView
    }()
    
  
    

    
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
    //////////////////////////////////////////////////////////////////////
    let lblName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Default Month Year text"
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = true
        return lbl
    }()
    

        let rightBtn = UIButton(frame: CGRect(x: 275, y: -27, width: 100, height: 100))
            let leftBtn = UIButton(frame: CGRect(x: 0, y: -27, width: 100, height: 100))
    
    func displayCalendar(){
 
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
      
        var monthsArr = ["January","February","March","April","May","June","July","August","September","October", "November", "December"]

        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        self.addSubview(lblName)
    
       lblName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        lblName.text = "\(monthsArr[currentMonthIndex]) \(currentYear)"
        lblName.frame = CGRect(x:0, y:-25, width: frame.width , height: 100)
        

        rightBtn.tintColor = .white
        rightBtn.setTitle(">", for: .normal)
        rightBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.addSubview(rightBtn)
        
        leftBtn.tintColor = .white
        leftBtn.setTitle("<", for: .normal)
        leftBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.addSubview(leftBtn)
 
        ////////////////////////////////////////////////////
      
        leftBtn.isHidden = false
        rightBtn.isHidden = false
        myStackView.isHidden = false
        myCollectionView.isHidden = false
  

  
        /////////////////////////////////////////////////////////
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth = getFirstWeekDay()
        
    presentMonthIndex = currentMonthIndex
        presentYear = currentYear
        backgroundColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
   
         addSubview(myCollectionView)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(dateCVCell.self, forCellWithReuseIdentifier: "Cell")
              addSubview(myStackView)
        myStackView.frame =  CGRect(x:15, y:5, width: frame.width - 40 , height: 100)
        myCollectionView.frame = CGRect(x: 20, y: 65, width: frame.width - 50, height: frame.height)

        if (!alreadyDisplayed){
        var daysArr = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
        for i in 0..<7 {
            let lbl = UILabel()
            lbl.text = daysArr[i]
            lbl.textAlignment = .center
            lbl.textColor = UIColor.white
            myStackView.addArrangedSubview(lbl)
            alreadyDisplayed = true
            }
        }
        
        self.bringSubviewToFront(rightBtn)
        self.bringSubviewToFront(leftBtn)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.clear
        let lbl = cell?.subviews[1] as! UILabel
        lbl.textColor = UIColor.white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfDaysInMonth[currentMonthIndex - 1] + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! dateCVCell
        cell.backgroundColor = .clear
        
        if indexPath.item <= firstWeekDayOfMonth - 2{
            cell.isHidden = true
        } else {
            let calcDate = indexPath.row - firstWeekDayOfMonth+2
            cell.isHidden = false
            cell.lbl1.text = "\(calcDate)"
            if calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
                cell.isUserInteractionEnabled = false
                cell.lbl1.textColor = UIColor.lightGray
            } else {
                cell.isUserInteractionEnabled = true
                cell.lbl1.textColor = UIColor.white
            }
            
        }
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/7 - 10
        let height: CGFloat = 20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex)-01".date?.firstDayOfTheMonth.weekday)!
        return day == 7 ? 1 : day
    }
    func didChangeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex = monthIndex + 1
        currentYear = year
        
        firstWeekDayOfMonth = getFirstWeekDay()
        myCollectionView.reloadData()
        
        leftBtn.isEnabled = !(currentMonthIndex == presentMonthIndex && currentYear == presentYear)
    }
    @objc func buttonAction(sender: UIButton!) {
        monthcount += 1
        if(monthcount > 3){
    rightBtn.isEnabled = false
        }
        
        if sender == rightBtn {
            currentMonthIndex += 1
            if currentMonthIndex > 11 {
                currentMonthIndex = 0
                currentYear += 1
            }
        } else {
            rightBtn.isEnabled = true
            monthcount -= 2
            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                currentMonthIndex = 11
                currentYear -= 1
            }
        }
        lblName.text = "\(monthsArr[currentMonthIndex]) \(currentYear)"
//        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
    }
    
    
 ////////////////////////////////////////////////////////////////////////////////
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

   backgroundColor = .white
        leftBtn.isHidden = true
        rightBtn.isHidden = true
        myStackView.isHidden = true
        myCollectionView.isHidden = true
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
extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    }
}
extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var date: Date? {
        return String.dateFormatter.date(from: self)
    }
}

class dateCVCell: UICollectionViewCell{
    override init(frame: CGRect){
        super.init(frame:frame)
        backgroundColor = UIColor.clear
        layer.cornerRadius = 5
layer.borderWidth = 0
       

        layer.masksToBounds = true
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        addSubview(lbl1)
        lbl1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lbl1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lbl1.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lbl1.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    let lbl1: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
   label.backgroundColor = .clear
        return label
    }()
}
