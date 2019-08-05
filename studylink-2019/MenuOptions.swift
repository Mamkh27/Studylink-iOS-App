//
//  MenuOptions.swift
//  studylink-2019
//
//  Created by Manprit Heer on 8/2/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class MenuOptions:  UIView, UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout{
    
    let Cell = "Cell"
    


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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell, for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = .blue
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
        
    }
    
    func displayCalendar(){
        
    }
    
    func displayMutuals(){
        
    }
    
}
