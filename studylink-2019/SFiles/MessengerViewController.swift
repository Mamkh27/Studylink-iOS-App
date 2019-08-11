//
//  messengerViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 7/11/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class MessengerViewController: UIViewController, CellTapped{
    func cellGotTapped(indexOfCell: Int) {
        if (tabbar.clickedCardBtn){
            self.performSegue(withIdentifier: "cardSegue1", sender: nil)
        }
        if (tabbar.clickedChatBtn){
            
        }
        if(tabbar.clickedProfileBtn){
             self.performSegue(withIdentifier: "profileSegue1", sender: nil)
        }
    }
  
    @IBOutlet var navBarImage: UIImageView!
    
    @IBOutlet var firstName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        self.tabbar.delegate = self
        
        print("Reaching Messenger View")
        self.navigationItem.title = "Messenger"
        let image = UIImage(named: "icons8-search-30")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showMessages))
        
        // Do any additional setup after loading the view.
    }
    
    @objc func showMessages(){
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "userMessageView") as! MessageUserViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    let tabbar: TabBar = {
        let tb = TabBar()
        return tb
    }()
    
    private func setupTabBar(){
        view.addSubview(tabbar)
        
        addContraintsWithFormat("H:|[v0]|", views: tabbar)
        addContraintsWithFormat("V:|[v0(55)]", views: tabbar)
        tabbar.transform = CGAffineTransform(translationX: 0, y: 615)
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
