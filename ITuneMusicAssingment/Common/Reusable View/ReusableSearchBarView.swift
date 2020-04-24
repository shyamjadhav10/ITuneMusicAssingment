//
//  ReusableSearchBarView.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import UIKit


@objc protocol ReusableSearchBarDelegate : class {
    func textDidChange(text: String)
    @objc optional func textBeginEditing()
}


class ReusableSearchBarView: UIView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var delegate: ReusableSearchBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fromNib()
        styleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fromNib()
        styleView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleView()
    }
    
    func styleView() {
        setView()
    }
    
    func setView(tintColor: UIColor = UIColor.white,
                 backgroundColor: UIColor = UIColor.gray,
                 textColor: UIColor = UIColor.black,
                 textFont: UIFont = UIFont.systemFont(ofSize: 12),
                 placeholderText: String = "Search Music",
                 textBackgroundColor : UIColor? = nil,
                 delegate: ReusableSearchBarDelegate? = nil) {
        
        self.searchBar.barTintColor = tintColor
        self.searchBar.showsCancelButton = false
        self.searchBar.searchBarStyle = .default
        self.searchBar.barStyle = .default
        self.searchBar.tintColor = tintColor
        self.searchBar.placeholder = placeholderText
        self.searchBar.backgroundColor = backgroundColor
        self.searchBar.delegate = self
        self.searchBar.isTranslucent = true
        self.searchBar.backgroundImage = UIImage()
        
        if let searchField = self.searchBar.value(forKey: "searchField") as? UITextField {
            DispatchQueue.main.async {
                
                if textBackgroundColor != nil {
                    searchField.backgroundColor = textBackgroundColor!
                    
                    UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white], for: .normal)
                }
            }
        }
        self.delegate = delegate
    }
    
    
    func clearView() {
        self.searchBar.text = ""
        self.searchBar.endEditing(true)
    }
}

extension ReusableSearchBarView: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
        self.delegate?.textBeginEditing?()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.searchBar.endEditing(true)
        self.delegate?.textDidChange(text: "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.delegate?.textDidChange(text: searchText)
    }
}
