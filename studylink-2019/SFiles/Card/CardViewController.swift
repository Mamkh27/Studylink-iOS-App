//
//  CardViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

//card layout
struct ModelCollectionFlowLayout {
    var firstName: String = " "
    var lastName: String = " "
    var image: UIImage!
}

class CardViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let cellId = "cellId"
    var arrData = [ModelCollectionFlowLayout]()
    @IBOutlet var calendarBtn: UIButton!
    @IBOutlet var startChat: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarSetUp()
        collectData()
        setupCollectionView()
        self.view.bringSubviewToFront(self.calendarBtn)
        self.view.bringSubviewToFront(collectionView)
    }
    
// Calendar Functions
    
    @IBAction func popUpCalendar(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "calendarPopUpID") as! CalendarViewController
        
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    @IBAction func popUpMutuals(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mutualsPopUpID") as! MutualsViewController
        
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    func calendarSetUp(){
        let origImage = UIImage(named: "calendar.png")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        calendarBtn.setImage(tintedImage, for: .normal)
        calendarBtn.tintColor = UIColor(red: 7/255, green: 51/255, blue: 70/255, alpha: 1.0)
        
        calendarBtn.frame.origin.y = calendarBtn.frame.origin.y + 50
    }
    
    
    
//Carousel Card Functions
    
    func collectData(){
        arrData = [
            
            ModelCollectionFlowLayout(firstName: "Mark", lastName: "Zuckerberg", image: UIImage(named:"basic.jpg")),
            ModelCollectionFlowLayout(firstName: "Jon", lastName: "Snow", image: UIImage(named:"basic3.jpg")),
            ModelCollectionFlowLayout(firstName: "Johnny", lastName: "Bravo", image: UIImage(named:"basic2.jpg")),
            ModelCollectionFlowLayout(firstName: "Mark", lastName: "Zuckerberg", image: UIImage(named:"basic.jpg")),
            ModelCollectionFlowLayout(firstName: "Jon", lastName: "Snow", image: UIImage(named:"basic3.jpg")),
            ModelCollectionFlowLayout(firstName: "Johnny", lastName: "Bravo", image: UIImage(named:"basic2.jpg")),
            ModelCollectionFlowLayout(firstName: "Mark", lastName: "Zuckerberg", image: UIImage(named:"basic.jpg")),
            ModelCollectionFlowLayout(firstName: "Jon", lastName: "Snow", image: UIImage(named:"basic3.jpg")),
            ModelCollectionFlowLayout(firstName: "Johnny", lastName: "Bravo", image: UIImage(named:"basic2.jpg")),
            ModelCollectionFlowLayout(firstName: "Mark", lastName: "Zuckerberg", image: UIImage(named:"basic.jpg")),
            ModelCollectionFlowLayout(firstName: "Jon", lastName: "Snow", image: UIImage(named:"basic3.jpg")),
            ModelCollectionFlowLayout(firstName: "Johnny", lastName: "Bravo", image: UIImage(named:"basic2.jpg")),
            ModelCollectionFlowLayout(firstName: "Mark", lastName: "Zuckerberg", image: UIImage(named:"basic.jpg")),
            ModelCollectionFlowLayout(firstName: "Jon", lastName: "Snow", image: UIImage(named:"basic3.jpg")),
            ModelCollectionFlowLayout(firstName: "Johnny", lastName: "Bravo", image: UIImage(named:"basic2.jpg")),
            ModelCollectionFlowLayout(firstName: "Mark", lastName: "Zuckerberg", image: UIImage(named:"basic.jpg")),
            ModelCollectionFlowLayout(firstName: "Jon", lastName: "Snow", image: UIImage(named:"basic3.jpg")),
            ModelCollectionFlowLayout(firstName: "Johnny", lastName: "Bravo", image: UIImage(named:"basic2.jpg")),
            ModelCollectionFlowLayout(firstName: "Mark", lastName: "Zuckerberg", image: UIImage(named:"basic.jpg")),
            ModelCollectionFlowLayout(firstName: "Jon", lastName: "Snow", image: UIImage(named:"basic3.jpg"))
            
        ]
    }
    func setupCollectionView(){
        collectData()
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        let customflow = UPCarouselFlowLayout()
        customflow.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: collectionView.frame.size.height)
        customflow.scrollDirection = .horizontal
        customflow.sideItemScale = 0.8
        customflow.sideItemAlpha = 1.0
        customflow.spacingMode = .fixed(spacing: 5.0)
        collectionView.collectionViewLayout = customflow
        collectionView.layer.cornerRadius = 13.0
        
    }
    
func scrollViewDidEndDecelerating( _ scrollView: UIScrollView){
    let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
    let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
    let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
    currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
}

fileprivate var currentPage: Int = 0{
    didSet{
        print("page at center = \(currentPage)")
    }
}

fileprivate var pageSize: CGSize {
    let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
    var pageSize = layout.itemSize
    if layout.scrollDirection == .horizontal {
        pageSize.width += layout.minimumLineSpacing
    } else {
        pageSize.height += layout.minimumLineSpacing
    }
    return pageSize
}
    
    @objc func chatPage(){
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "messengerView") as! MessengerViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
//custom UIVIew Constraints

    func addConstraintsWithFormat(_ format: String, views: UIView...) {
            var viewDict = [String: UIView]()
            
            for (index, view) in views.enumerated() {
                let key = "v\(index)"
                view.translatesAutoresizingMaskIntoConstraints = false
                viewDict[key] = view
            }
            
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
        }
}


extension CardViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.img.image = arrData[indexPath.row].image
        cell.firstLbl.text = arrData[indexPath.row].firstName
        cell.lastLbl.text = arrData[indexPath.row].lastName
        cell.img.contentMode = .scaleAspectFill
        return cell
    }
}


// Panning Gesture Feature UNDER CONSTRUCTION
/*
 
 @IBAction func resetBtn(_ sender: Any) {
 resetCard()
 }
 
 @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
 let card = sender.view!
 let point = sender.translation(in: view)
 let yFromCenter = card.center.y - view.center.y
 
 card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
 
 if yFromCenter < 0 {
 //   linkedView.image = UIImage(named: "linked.png")
 
 // linkedView.tintColor = .green
 
 } else {
 //  linkedView.image = nil;
 }
 
 // linkedView.alpha = abs(yFromCenter) / view.center.y
 
 if sender.state == UIGestureRecognizer.State.ended {
 if card.center.y < 75 {
 //Move the card all the way up, off the screen
 UIView.animate(withDuration: 0.3, animations: {
 card.center = CGPoint(x: card.center.x , y: card.center.y - 200 )
 card.alpha = 0
 })
 performSegue(withIdentifier: "swipeUp", sender: self)
 return
 }
 
 } else if card.center.x < 75 {
 resetCard()
 //Move to left side to previous card
 
 //    UIView.animate(withDuration: 0.3, animations: {
 //     card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
 //     card.alpha = 0;
 //   })
 return
 
 //FIX ME: INSERT CODE FOR PREVIOUS CARD HERE
 
 } else if card.center.x > (view.frame.width - 85){
 resetCard()
 //Move to right side to next card
 //    UIView.animate(withDuration: 0.3, animations: {
 //     card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
 card.alpha = 0;//
 //   })
 
 //FIX ME: INSERT CODE FOR NEW CARD HERE
 
 return
 }
 //go back to center
 resetCard()
 }
 
 
 
 func resetCard(){
 
 UIView.animate(withDuration: 0.2, animations: {
 self.collectionView.center = self.view.center
 //  self.linkedView.alpha = 0
 self.collectionView.alpha = 1
 })
 
 
 }
*/
