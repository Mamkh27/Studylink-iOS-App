//
//  MenuBar.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/11/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

protocol CellTapped: class {
    /// Method
    func cellGotTapped(indexOfCell: Int)
}

class TabBar: MenuOptions{

  var delegate: CellTapped!
    
    var whichOptionisActive = "profile"
    let menuOps = MenuOptions()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        
        cv.alpha = 1.0
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["iconUser0", "iconUser4","iconUser2"]
var clickedChatBtn = false
var clickedCardBtn = false
var clickedProfileBtn = false
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        collectionView.register(TabCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addContraintsWithFormat("H:|[v0]|", views: collectionView)
        addContraintsWithFormat("V:|[v0]|", views: collectionView)
        let selectedIndexPath = NSIndexPath(item:0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition:[])
        menuOps.hideCalendar()
        
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(delegate != nil) {
            self.delegate.cellGotTapped(indexOfCell: indexPath.item)
        }
        if ((imageNames[indexPath.item] == "iconUser4")){
               clickedCardBtn = true
            clickedChatBtn = false
            clickedCardBtn = false
        }
        
        if (imageNames[indexPath.item] == "iconUser2"){
            clickedChatBtn = true
            clickedCardBtn = false
            clickedProfileBtn = false
            
        }
        if (imageNames[indexPath.item] == "iconUser0"){
            clickedProfileBtn = true
            clickedChatBtn = false
            clickedCardBtn = false
            
        }
        print(whichOptionisActive)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if(delegate != nil) {
            self.delegate.cellGotTapped(indexOfCell: indexPath.item)
        }
        if ((imageNames[indexPath.item] == "iconUser4")){
            clickedCardBtn = true
            clickedChatBtn = false
            clickedProfileBtn = false
            
        }
        
        if (imageNames[indexPath.item] == "iconUser2"){
            clickedChatBtn = true
            clickedCardBtn = false
            clickedProfileBtn = false
            
        }
        if (imageNames[indexPath.item] == "iconUser0"){
            clickedProfileBtn = true
            clickedChatBtn = false
            clickedCardBtn = false
            
        }
        print(whichOptionisActive)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TabCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        
        if (clickedChatBtn){
            if(imageNames[indexPath.item] == "iconUser0"){
                cell.isSelected = false
                cell.isHighlighted = false
            }
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:frame.width / 3, height:frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContraintsWithFormat(_ format: String, views: UIView...) {
        var viewDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
    }
}



class TabCell: BaseCell {
    
    
    func addContraintsWithFormat(_ format: String, views: UIView...) {
        var viewDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
    }
    
    var imageView: UIImageView = {
        let iv = UIImageView()
      //  iv.image = UIImage(named: "iconTab0")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .white

        
        return iv
    }()
    
    
    override var isHighlighted: Bool {
        didSet{
           
            if (isHighlighted){
                imageView.tintColor = UIColor.white
                 backgroundColor = UIColor(red:58/255, green: 170/255, blue: 204/255, alpha: 1.0)
            }
            else {
                 backgroundColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
            }

    }
    }
    override var isSelected: Bool {
        didSet{
            
            if (isSelected){
                imageView.tintColor = UIColor.white
           backgroundColor = UIColor(red:58/255, green: 170/255, blue: 204/255, alpha: 1.0)
            } else {
                backgroundColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
            }
        }
        
        
    }
    override func setupViews(){
        super.setupViews()
        backgroundColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)

        addSubview(imageView)
        addContraintsWithFormat("H:[v0(28)]", views: imageView)
        addContraintsWithFormat("V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier:1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier:1, constant: 0))
        
    }
}

