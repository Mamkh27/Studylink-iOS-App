//
//  AddClassesViewController.swift
//  studylink-2019
//
//  Created by Krishna Chenna on 8/4/19.
//  Copyright © 2019 Manprit Heer. All rights reserved.
//

import UIKit

class AddDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(classList.count)
        return classList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath)
        
        
        cell.textLabel?.text = classList[indexPath.row]
        
        return cell
    }
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var classesTable: UITableView!
    var classList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getClassList()
        
        classesTable.delegate = self
        classesTable.dataSource = self
    }
    
    func getClassList(){
        let session = URLSession.shared
        let url = URL(string: "http://localhost:3002/api/getClasses")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Server Error")
                    return
            }
            print("Getting Class list")
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                guard let jsonArray = json as? [[String: Any]] else {
                    return
                }
                
                for dic in jsonArray{
                    let name = dic["Name"] as? String ?? ""
                    self.classList.append(name)
                }
                
                print(self.classList)
                self.reload()
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        })
        
        task.resume()
        print(self.classList)
    }
    
    func reload(){
        self.classesTable.reloadData()
    }
    

}
