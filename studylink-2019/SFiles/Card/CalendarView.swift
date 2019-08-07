//

//  CalendarView.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/5/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//
import UIKit
/*
struct Colors {
    static var darkGray = UIColor.darkGray
    static var darkRed = UIColor.red
}


struct Style {
    
    
    var bgColor = UIColor.darkGray
    var monthViewLblColor = UIColor.white
    var  monthViewBtnRightColor = UIColor.white
    var  monthViewBtnLeftColor = UIColor.white
    var  activeCellLblColor = UIColor.white
    var  activeCellLblColorHighlighted = UIColor.black
    var weekdaysLblColor = UIColor.white
    
}
class CalendarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MonthViewDelegate{

func hidecalendar(){
    monthView.btnLeft.isHidden = true
    monthView.hide()
    weekdaysView.hide()
    backgroundColor = .clear
    monthView.isHidden = true
    weekdaysView.isHidden = true
    myCollectionView.isHidden = true
    myCollectionView.alpha = 0
    monthView.alpha = 0
    weekdaysView.alpha = 0
    
}

var numOfDaysInMonth = [31, 28, 31, 30, 31, 30,31, 31,30, 31,30,31]
var currentMonthIndex: Int = 0
var currentYear: Int = 0
var presentMonthIndex = 0
var presentYear = 0
var todaysDate = 0
var firstWeekDayOfMonth = 0

override init(frame: CGRect){
    super.init(frame: frame)
    initializeView()
    
    
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
    cell.backgroundColor = .white
    if indexPath.item <= firstWeekDayOfMonth - 2{
        cell.isHidden = true
    } else {
        let calcDate = indexPath.row - firstWeekDayOfMonth+2
        cell.isHidden = false
        cell.lbl.text = "\(calcDate)"
        if calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
            cell.isUserInteractionEnabled = false
            cell.lbl.textColor = UIColor.lightGray
        } else {
            cell.isUserInteractionEnabled = true
            cell.lbl.textColor = UIColor.white
        }
        
    }
    return cell
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width/7 - 8
    let height: CGFloat = 40
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
    
    monthView.btnLeft.isEnabled = !(currentMonthIndex == presentMonthIndex && currentYear == presentYear)
}





func initializeView(){
    currentMonthIndex = Calendar.current.component(.month, from: Date())
    currentYear = Calendar.current.component(.year, from: Date())
    todaysDate = Calendar.current.component(.day, from: Date())
    firstWeekDayOfMonth = getFirstWeekDay()
    
    presentMonthIndex = currentMonthIndex
    presentYear = currentYear
    backgroundColor = .darkGray
    setupViews()
    
    myCollectionView.delegate = self
    myCollectionView.dataSource = self
    myCollectionView.register(dateCVCell.self, forCellWithReuseIdentifier: "Cell")
}

func setupViews(){
    addSubview(monthView)
    
    monthView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    monthView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    monthView.heightAnchor.constraint(equalToConstant: 35).isActive = true
    monthView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    monthView.delegate = self
    
    addSubview(weekdaysView)
    weekdaysView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    weekdaysView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    //  weekdaysView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    weekdaysView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    
    addSubview(myCollectionView)
    weekdaysView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    weekdaysView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
    weekdaysView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    weekdaysView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    
}

let monthView: MonthView = {
    let v = MonthView()
    v.translatesAutoresizingMaskIntoConstraints = false
    return v
}()

let weekdaysView: WeekdaysView = {
    let v = WeekdaysView()
    v.translatesAutoresizingMaskIntoConstraints = false
    return v
}()

let myCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    let myCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    myCollectionView.showsHorizontalScrollIndicator = false
    myCollectionView.translatesAutoresizingMaskIntoConstraints = false
    myCollectionView.backgroundColor = UIColor.clear
    myCollectionView.allowsMultipleSelection = false
    return myCollectionView
}()
required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

}
*/


  

    


    
 
    
  
    

    
    


    
  
    
  
    
  

 

