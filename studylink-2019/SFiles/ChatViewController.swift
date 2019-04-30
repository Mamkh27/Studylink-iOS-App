//
//  ChatViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 4/30/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit
import SwiftKeyChainWrapper

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

            tableView.delegate = self
        
            tableView.dataSource.self
        // Do any additional setup after loading the view.
    }
    func numOfSections(in tableView: UITableView) -> Int{
        return 1;
    }
    func tableView(_tableView: UITableView, numberofRows section: Int) -> Int{
        return 1;
    }

    func tableView(_tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    }
}
