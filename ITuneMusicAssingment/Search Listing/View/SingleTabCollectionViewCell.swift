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
        self.backgroundColor = UIColor.clear
        priceLabel.font = UIFont.boldSystemFont(ofSize: 11.0)
        trackTimeGenreLabel.font = UIFont.boldSystemFont(ofSize: 11.0)
        trackName.font = UIFont.boldSystemFont(ofSize: 11.0)
        collectionNameLabel.font = UIFont.boldSystemFont(ofSize: 11.0)
        artistName.font = UIFont.boldSystemFont(ofSize: 11.0)
        trackImageView.setRoundedCorners(cornerRadius: 5.0)
    }

    //  Configuring response
    func setData(_ viewModel : TrackViewModel){
        setLabel(label: trackName, text: viewModel.trackName)
        setLabel(label: artistName, text: viewModel.artistName)
        setLabel(label: priceLabel, text: viewModel.trackPriceInCurrency)
        setLabel(label: collectionNameLabel, text: viewModel.collectionName)
        setLabel(label: trackTimeGenreLabel, text:viewModel.trackTimeAndGenre)
        setImage(url: viewModel.artworkUrl100)
    }
    
    
    private func setImage(url : String){
        trackImageView.fetchImages(pictureUrl: url)
    }
    
    private func setLabel(label : UILabel, text : String){
        label.text = text
        label.isHidden = text.isEmpty
    }
}
