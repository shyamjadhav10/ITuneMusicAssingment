//
//  TrackListViewModel.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation


class TrackListViewModel {
    
    // MARK: - Constants
    let screenTitle =  "iMusic"
    let cellIdentifier = "SingleTabCollectionViewCell"
    
    
    // MARK: - Listeners
    var isLoading: Bindable<Bool> = Bindable(false)
    var tracks: Bindable<[Track]?> = Bindable(nil)
    var error: Bindable<CommonError?> = Bindable(nil)
    
    
    // MARK: - Private Properties
    private var resultCount: Int = 0
    private var httpClient: HTTPClient!
    
    init(client: HTTPClient? = nil) {
        self.httpClient = client ?? HTTPClient.shared
    }
    
    

    func cellViewModel(indexPath: IndexPath)-> TrackViewModel {
        let track = self.tracks.value![indexPath.row]
        return TrackViewModel(track: track)
    }
    
    var numberOfItems : Int {
        return resultCount
    }
    
    
    // MARK: - API
    func getTrackList(params : [String : String]) {
        isLoading.value = true
        httpClient.dataTask(TrackAPI.getTrackList(params: params)) { [weak self] (result) in
            guard let self = self else {
                return
            }
            
            self.isLoading.value = false
            switch result {
                
            case .success(let data):
                guard let data = data else {
                    return
                }
                do {
                    let tracks = try JSONDecoder().decode(TracksResponse.self, from: data)
                    self.resultCount = tracks.resultCount
                    self.tracks.value = tracks.tracks
                } catch {
                    debugPrint("Unable to decode track List \(error)")
                }
            case .failure(let error):
                self.error.value = CommonError(error.localizedDescription)
                debugPrint("Error in fetching tracks \(error)")
            }
        }
    }    
}
