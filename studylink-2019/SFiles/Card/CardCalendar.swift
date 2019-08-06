//
//  CardCalendar.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/5/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import Foundation
import UIKit

class CardCalendar: UIView, UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var Calendar: UICollectionView!
    
    var monthLbl = UILabel()
    var dateLbl = UILabel()

    let Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let DaysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    func displayCalendar(){
        setupMonth()
        setupDays()
    }
    
    func setupMonth(){
        currentMonth = Months[month]
        monthLbl.text = "\(currentMonth) \(year)"
        
    }
    
    func setupDays(){
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DaysInMonths[month]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell

    cell.backgroundColor = UIColor.clear
    cell.DateLabel.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    
    
    
    
    
    
    
}

class DateCollectionViewCell: UICollectionViewCell{
    var DateLabel = UILabel()
    func identifier
}
