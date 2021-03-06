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
        self.title = viewModel.screenTitle
        getTrackList()
        setupSearchBar()
        setupCollectionView()
    }
    
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12.0
        layout.minimumLineSpacing = 12.0
        layout.sectionInset = UIEdgeInsets.init(top: 12.0, left: 16.0,
                                                bottom: 12.0, right: 16.0)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.black
        collectionView.registerNib(viewModel.cellIdentifier)
    }
    
    func setupSearchBar(){
        self.searchBarView.setView(delegate: self)
    }
    
    
    // MARK: - API Calls
    private func getTrackList(query : String = "") {
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
        viewModel.getTrackList(query: query)
    }
}


// MARK: - Data Source
extension MusicSearchListingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        
        let cellWidth = ((self.view.frame.size.width / 2) - 32)
        return CGSize(width: cellWidth, height: viewModel.cellHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier, for: indexPath) as? SingleTabCollectionViewCell else {  return UICollectionViewCell()  }
        
        collectionViewCell.setData(viewModel.cellViewModel(indexPath: indexPath))
        return collectionViewCell
    }
}


// MARK: - Delegate
extension MusicSearchListingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


// MARK: - Search Bar Delegate
extension MusicSearchListingViewController: ReusableSearchBarDelegate {
    func textDidChange(text: String) {
        if !text.isEmpty {
            let trimmedText = (text.trimmingCharacters(in: .whitespacesAndNewlines)).lowercased()
            if trimmedText.count > 2 {
                self.getTrackList(query: trimmedText)
            }
        }
    }
}
