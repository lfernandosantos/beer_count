//
//  LastBearsViewController.swift
//  BeerCounter
//
//  Created by Fernando on 24/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import Foundation
import UIKit

class LastBearsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension LastBearsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "bear"
        
        return cell
    }
    
    
}
