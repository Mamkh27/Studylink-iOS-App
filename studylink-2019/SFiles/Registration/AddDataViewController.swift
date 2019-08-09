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
        
        
        cell.textLabel?.text = classList[indexPath.row].name
        
        let class_info_str = classList[indexPath.row].professor + " \u{2022} " + classList[indexPath.row].time + " \u{2022} " +  classList[indexPath.row].days
        
        cell.detailTextLabel?.text = class_info_str
        
        
        return cell
    }
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var classesTable: UITableView!
    var classList: [ClassInfo] = []
    
    struct ClassInfo {
        var name: String
        var professor: String
        var time: String
        var days: String
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let queue = DispatchQueue(label: "work-queue")
        queue.async {
            print("Thread: ", Thread.current)
            self.getClassList()
        }
        
        print("ClassList:", classList)
        classesTable.delegate = self
        classesTable.dataSource = self
        classesTable.tableFooterView = UIView(frame: .zero)
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
                    let professor = dic["Professor"] as? String ?? ""
                    let time = dic["Time"] as? String ?? ""
                    let days = dic["Days"] as? String ?? ""
                    
                    let class_val = ClassInfo(name: name, professor: professor, time: time, days: days)
                    self.classList.append(class_val)
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
        DispatchQueue.main.async {
            self.classesTable.reloadData()
        }
        
    }
    
    
}
