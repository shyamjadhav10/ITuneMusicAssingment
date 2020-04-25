//
//  TrackViewModel.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation
import UIKit

class TrackViewModel {
    
    private let track : Track!
    
    let artistName: String
    let trackId: Int
    let trackName: String
    let trackViewUrl: String
    let previewUrl: URL?
    let artworkUrl100: String
    let releaseDate: String
    let primaryGenreName: String
    let trackPrice: Float?
    let currency: String
    let trackTimeMillis: Int?
    let collectionName: String?
    
    init() {
        
    }
    
    init(track: Track) {
        self.track = track
        
        artistName = track.artistName
        previewUrl = URL(string: track.previewUrl ?? "")
        trackId = track.trackId
        trackName = track.trackName
        trackViewUrl = track.trackViewUrl
        artworkUrl100 = track.artworkUrl100
        releaseDate = track.releaseDate
        primaryGenreName = track.primaryGenreName
        trackPrice = track.trackPrice
        currency = track.currency
        trackTimeMillis = track.trackTimeMillis
        collectionName = track.collectionName
    }
}
