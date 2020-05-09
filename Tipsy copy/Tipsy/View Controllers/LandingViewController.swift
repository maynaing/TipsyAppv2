//
//  LandingViewController.swift
//  Tipsy
//
//  Created by May Naing on 5/7/20.
//  Copyright © 2020 May Naing. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LandingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var sideBarButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var postData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        
        // Show Previous Calculations from Database
        databaseHandle = ref?.child("Totals").observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            
            if let actualPost = post {
                self.postData.append(actualPost)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        return cell!
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    @IBAction func sideBarTapped(_ sender: Any) {
        guard let sideBarViewController = storyboard?.instantiateViewController(identifier: "SideBarViewController") else { return}
        present(sideBarViewController, animated: true)
    }
}
