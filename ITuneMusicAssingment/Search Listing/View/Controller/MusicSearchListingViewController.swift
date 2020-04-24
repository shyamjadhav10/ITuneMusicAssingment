//
//  MusicSearchListingViewController.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 23/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import UIKit

class MusicSearchListingViewController: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Declarations
    private let viewModel = TrackListViewModel()
    
    
    // MARK: - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Setup Methods
    func setupView(){
        getTrackList()
    }
    


    // MARK: - API Calls
    private func getTrackList() {
        //Binding
        viewModel.isLoading.bind { [unowned self] isLoading in
            // self.view.showLoader(show: isLoading)
        }
        
        viewModel.tracks.bind { [unowned self] (tracks) in
            if tracks != nil {
            }
        }
        
        viewModel.error.bind { [unowned self] (error) in
            if let error = error {
                Utils.displayAlert(title: "Error", message: error.localizedDescription)
            }
        }
        
        //Get Contacts
        viewModel.getTrackList()
    }
}

