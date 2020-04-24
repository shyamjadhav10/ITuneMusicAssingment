//
//  Constant.swift
//  ITuneMusicAssingment
//
//  Created by Shyam Jadhav on 24/04/20.
//  Copyright © 2020 Shyam Jadhav. All rights reserved.
//

import Foundation
import UIKit

class Constants {

//Constant Values
static let screenBounds = UIScreen.main.bounds.size
static let statusBarHeight = UIApplication.shared.statusBarFrame.height


//MARK:- API Helpers
static let apiBaseUrl =  "https://itunes.apple.com" //Utils.getSchemeKey("API_BASE_URL")
static let apiKey =  ""
static let infiniteFetchThreshold = 1
static let apiResponseLimit = 15

static let imageCache = NSCache<NSString, UIImage>() // using cache for images those are already downloaded

}
