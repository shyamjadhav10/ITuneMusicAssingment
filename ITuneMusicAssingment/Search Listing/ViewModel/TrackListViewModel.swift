//
//  TrackListViewModel.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation


class ContactListViewModel {
    
    let screenTitle =  "iMusic"
    
    var isLoading: Bindable<Bool> = Bindable(false)
    var tracks: Bindable<[Track]?> = Bindable(nil)
    var error: Bindable<CommonError?> = Bindable(nil)


    private var httpClient: HTTPClient!


    init(client: HTTPClient? = nil) {
           self.httpClient = client ?? HTTPClient.shared
    }
       

    

}
