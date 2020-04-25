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
    @IBOutlet weak var trackTimeGenreLabel: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    //MARK: - Declarations
    
    
    
    // MARK: - Default Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    // MARK: - Setup Methods
    private func setupView() {
        priceLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        trackTimeGenreLabel.font = UIFont.boldSystemFont(ofSize: 13.0)
        trackName.font = UIFont.boldSystemFont(ofSize: 13.0)
        collectionNameLabel.font = UIFont.boldSystemFont(ofSize: 13.0)
        artistName.font = UIFont.boldSystemFont(ofSize: 13.0)
        
        trackImageView.image = UIImage(named: "")
        trackImageView.setRoundedCorners(cornerRadius: 3.0)
    }
    
    
    func setData(_ viewModel : TrackViewModel){
        setLabel(label: trackName, text: viewModel.trackName)
        setLabel(label: artistName, text: viewModel.artistName)
        setLabel(label: priceLabel, text: viewModel.trackPriceInCurrency)
        setLabel(label: collectionNameLabel, text: viewModel.collectionName)
        setLabel(label: trackTimeGenreLabel, text:viewModel.trackTimeAndGenre)
    }
    
    func setImage(){
        
    }
    
    private func setLabel(label : UILabel, text : String){
        label.text = text
        label.isHidden = text.isEmpty
    }
}
