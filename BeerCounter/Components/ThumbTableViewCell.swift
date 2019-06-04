//
//  ThumbTableViewCell.swift
//  BeerCounter
//
//  Created by Luiz Fernando dos Santos on 03/06/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import UIKit

class ThumbTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
