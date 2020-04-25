//
//  Track.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation



public struct Track: Decodable {
    
    let artistName: String
    let trackId: Int
    let trackName: String
    let trackViewUrl: String
    let previewUrl: String?
    let artworkUrl100: String
    let releaseDate: String
    let primaryGenreName: String
    let trackPrice: Float?
    let currency: String
    let trackTimeMillis: Int?
    let collectionName: String?
    
    
    enum CodingKeys: String, CodingKey {
        case artistName, trackId, trackName, trackViewUrl, previewUrl, artworkUrl100,
        releaseDate, primaryGenreName, trackPrice, currency, trackTimeMillis, collectionName
        case none = ""
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName) ?? ""
        self.trackId = try container.decodeIfPresent(Int.self, forKey: .trackId) ?? 0
        self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? ""
        self.trackViewUrl = try container.decodeIfPresent(String.self, forKey: .trackViewUrl) ?? ""
        self.previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl) ?? ""
        self.artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? ""
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        self.primaryGenreName = try container.decodeIfPresent(String.self, forKey: .primaryGenreName) ?? ""
        self.trackPrice = try container.decodeIfPresent(Float.self, forKey: .trackPrice) ?? 0.0
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency) ?? ""
        self.trackTimeMillis = try container.decodeIfPresent(Int.self, forKey: .trackTimeMillis) ?? 0
        self.collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName) ?? ""
    }
}


public struct TracksResponse: Decodable {
    
    let resultCount: Int
    var tracks: [Track] = []
    
    enum CodingKeys: String, CodingKey {
        case resultCount, results
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resultCount = try container.decodeIfPresent(Int.self, forKey: .resultCount) ?? 0
        
        if let list = try container.decodeIfPresent([Track].self, forKey: .results) {
            self.tracks = list
        }
    }
}
