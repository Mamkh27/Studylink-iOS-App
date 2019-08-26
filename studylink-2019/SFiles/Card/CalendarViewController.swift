//
//  CalendarViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/13/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MonthChangeDelegate{
weak var delegate: MonthChangeDelegate?
  
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
    let rightBtn = UIButton(frame: CGRect(x: 275, y: 175, width: 100, height: 100))
    let leftBtn = UIButton(frame: CGRect(x: 0, y: 175, width: 100, height: 100))
    
    let lblName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Default Month Year text"
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = true
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        displayCalendar()
        closeButton()
        showAnimate()
        leftBtn.isEnabled = false
    }
    
    
    func closeButton(){
        let button = UIButton(frame: CGRect(x: 150, y: 470, width: 70, height: 40))
            button.setTitle("Close", for: .normal)
            button.addTarget(self, action: #selector(buttonClose), for: .touchUpInside)
        
        self.view.addSubview(button)
    }

    @objc func buttonClose(sender: UIButton!) {
        self.removeAnimate()
    }
    
    func showAnimate(){
                self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
                self.view.alpha = 0.0
                UIView.animate(withDuration: 0.25, animations: {
                self.view.alpha = 1.0
                self.view.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
        })
    }
    
    func removeAnimate(){
                UIView.animate(withDuration: 0.25, animations: {
                self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
                self.view.alpha = 0.0
        }, completion: {(finished: Bool) in
            if (finished){
                self.view.removeFromSuperview()
            }
        });
        }
 
        
    
    //collection view protcols
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(red:58/255, green: 170/255, blue: 204/255, alpha: 1.0)
        let lbl = cell?.subviews[1] as! UILabel
        lbl.textColor = UIColor.white
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .clear
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
    
    //calendar specifics
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex)-01".date?.firstDayOfTheMonth.weekday)!
        return day == 7 ? 1 : day
    }
    
    //work in progress
    func didChangeMonth( monthIndex: Int,  year: Int){
        currentMonthIndex = monthIndex + 1
        currentYear = year
        
        firstWeekDayOfMonth = getFirstWeekDay()
        myCalendarView.reloadData()
        
        leftBtn.isEnabled = !(currentMonthIndex == presentMonthIndex && currentYear == presentYear)
        
            print("USER CLICKED NEXT MONTH, SHOW NEW DATES")
    }
    
    //user clicks for next/previous month
    @objc func buttonAction(sender: UIButton!) {
        monthcount += 1
        if(monthcount > 2){
            rightBtn.isEnabled = false
            leftBtn.isEnabled = true
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
        self.delegate?.didChangeMonth( monthIndex: currentMonthIndex, year: currentYear)
    }
    
    //collection view for calendar
    let myCalendarView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 0
        let myCalendarView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        myCalendarView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        myCalendarView.showsHorizontalScrollIndicator = false
        myCalendarView.translatesAutoresizingMaskIntoConstraints = true
        myCalendarView.backgroundColor = UIColor.clear
        myCalendarView.allowsMultipleSelection = false
        return myCalendarView
    }()
    
    let myStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = true
        return stackView
    }()
    
    
    func displayCalendar(){
        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        self.view.addSubview(lblName)
        
        lblName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lblName.text = "\(monthsArr[currentMonthIndex]) \(currentYear)"
        lblName.frame = CGRect(x:0, y: 200, width: self.view.frame.width , height: 50)
        lblName.backgroundColor =  UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        
        rightBtn.tintColor = .white
        rightBtn.setTitle(">", for: .normal)
        rightBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(rightBtn)
        
        leftBtn.tintColor = .white
        leftBtn.setTitle("<", for: .normal)
        leftBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(leftBtn)
        
        ////////////////////////////////////////////////////
        
        leftBtn.isHidden = false
        rightBtn.isHidden = false
        myStackView.isHidden = false
        myCalendarView.isHidden = false
        
        
        /////////////////////////////////////////////////////////
        
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth = getFirstWeekDay()
        
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
       myCalendarView.backgroundColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        
        view.addSubview(myCalendarView)
        myCalendarView.delegate = self
        myCalendarView.dataSource = self
        myCalendarView.register(dateCVCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(myStackView)
        myStackView.addBackground(color: UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0))
        myStackView.frame =  CGRect(x:0, y: view.center.y - 50, width: view.frame.width  , height: -50)
       myCalendarView.frame = CGRect(x: 0 , y: view.center.y-50, width: view.frame.width , height: 150)
    
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
        
        self.view.bringSubviewToFront(rightBtn)
        self.view.bringSubviewToFront(leftBtn)
    }

 }
