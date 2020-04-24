//
//  TrackListViewModel.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation


class TrackListViewModel {
    
    // Rendering data
    let screenTitle =  "iMusic"
    
    var isLoading: Bindable<Bool> = Bindable(false)
    var tracks: Bindable<[Track]?> = Bindable(nil)
    var error: Bindable<CommonError?> = Bindable(nil)

    private var httpClient: HTTPClient!    
    
    init(client: HTTPClient? = nil) {
        self.httpClient = client ?? HTTPClient.shared
    }
    
    
    func getTrackList() {
        isLoading.value = true
        httpClient.dataTask(TrackAPI.getTrackList) { [weak self] (result) in
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
                    let tracks = try JSONDecoder().decode([Track].self, from: data)
                    self.tracks.value = tracks
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
