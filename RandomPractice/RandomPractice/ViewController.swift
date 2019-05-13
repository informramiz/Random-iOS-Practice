//
//  ViewController.swift
//  RandomPractice
//
//  Created by Apple on 13/05/2019.
//  Copyright © 2019 RR Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Model
    let favoriteThings = [
        "Raindrops on roses",
        "Whiskers on kittens",
        "Bright copper kettles",
        "Warm woolen mittens"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register data source and delegates for table view
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteThingsCell")
        tableViewCell?.textLabel?.text = favoriteThings[indexPath.row]
        return tableViewCell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteThings.count
    }
}

