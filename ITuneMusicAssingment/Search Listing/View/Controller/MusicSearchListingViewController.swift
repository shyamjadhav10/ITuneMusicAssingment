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
    @IBOutlet weak var searchBarView: ReusableSearchBarView!
    
    
    // MARK: - Declarations
    private let viewModel = TrackListViewModel()
    
    
    // MARK: - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    // MARK: - Setup Methods
    func setupView(){
        getTrackList()
        setupSearchBar()
        setupCollectionView()
    }
    
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10.0
        layout.minimumLineSpacing = 10.0
        layout.sectionInset = UIEdgeInsets.init(top: 10.0, left: 10.0,
                                                bottom: 10.0, right: 10.0)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(viewModel.cellIdentifier)
    }
    
    func setupSearchBar(){
        self.searchBarView.setView(delegate: self)
    }
    
    
    // MARK: - API Calls
    private func getTrackList() {
        //Binding
        viewModel.isLoading.bind { [unowned self] isLoading in
            if isLoading {
                ActivityIndicator.sharedIndicator.displayActivityIndicator(onView: self.view)
            }else {
                ActivityIndicator.sharedIndicator.hideActivityIndicator()
            }
        }
        
        viewModel.tracks.bind { [unowned self] (tracks) in
            if tracks != nil {
                self.collectionView.reloadData()
            }
        }
        
        
        viewModel.error.bind {(error) in
            if let error = error {
                Utils.displayAlert(title: "Error", message: error.localizedDescription)
            }
        }
        
        viewModel.getTrackList()
    }
}

extension MusicSearchListingViewController: UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 20 , height: 30 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier, for: indexPath) as? SingleTabCollectionViewCell else {  return UICollectionViewCell()  }
        
        return collectionViewCell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}



extension MusicSearchListingViewController: ReusableSearchBarDelegate {
    
    func textDidChange(text: String) {
        if !text.isEmpty {
            
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
}
