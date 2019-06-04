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
        let nibCell = UINib(nibName: "ThumbTableViewCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "ThumbCell")
    }

    init() {
        super.init(nibName: "LastBears", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LastBearsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThumbCell", for: indexPath)

        if indexPath.row == 1 {
            guard let cellThumb = cell as? ThumbTableViewCell else {
                return cell
            }

            let nibThumb = UINib(nibName: "MoviesCollectionViewCell", bundle: nil)
            cellThumb.collectionView.register(nibThumb, forCellWithReuseIdentifier: "collectionCell")
            cellThumb.collectionView.delegate = self
            cellThumb.collectionView.dataSource = self

            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/2 - 10, height: 190)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 0.0
            cellThumb.collectionView.collectionViewLayout = flowLayout
            return cellThumb
        }

        cell.textLabel?.text = "nao foi!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 150
        }

        return 50
    }
}

extension LastBearsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MoviesCollectionViewCell

        cell.labelMovie.text = "Xayah"
        cell.frame.size.height = CGFloat(150)



        return cell
        
    }



}
