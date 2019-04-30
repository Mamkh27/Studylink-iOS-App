//
//  ChatViewController.swift
//  studylink-2019
//
//  Created by Manprit Heer on 4/30/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1;
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return;
}



    override func viewDidLoad() {
        super.viewDidLoad()
/*
            tableView.delegate = self
        
            tableView.dataSource.self
 
    }
    func numOfSections(in tableView: UITableView) -> Int{
       return 1;
   }
    func tableView(_tableView: UITableView, numberofRows section: Int) -> Int{
        return 1;
    }

    func tableView(_tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    }
 */
}

