//
//  SingleTabCollectionViewCell.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import UIKit

class SingleTabCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Outlets
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var yearAndTypeLabel: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    
    // MARK: - Declarations

    
    
    // MARK: - Default Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    // MARK: - Setup Methods
    func setupView(){
        
    }
    
}
