//
//  Constants.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import UIKit

var apiKey = "4b5248f87a44ca6247c8e65be153ffb5"
var accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YjUyNDhmODdhNDRjYTYyNDdjOGU2NWJlMTUzZmZiNSIsInN1YiI6IjVjMGI0YTE5YzNhMzY4MjUyODA2OWEyYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0HuRC5x0mPnz9s2qqaSkwdQ0mLZ-8fxVL1dIjd7-f98"
enum CacheIdentifiers: Hashable {
    case video_image_popular
}

enum MediaType: String {
    case tv
    case movie
    case credit
}

enum BaseLangue: String {
    case es = "es-ES"
    case en = "en-US"
    
    func getPrefix(_ lang: BaseLangue) -> String {
        return String(lang.rawValue.prefix(2))
    }
    
    func getSufix(_ lang: BaseLangue) -> String {
        return String(lang.rawValue.suffix(2))
    }
}

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}

enum ViewState {
    case idle
    case loading
    case finishedLoading
    case success
    case error
}

enum MediaRatingType: String {
    case popular
    case top_rated
    case upcoming
}

enum MediaCategories: Int {
    case action = 28
    case adventure = 12
    case animation = 16
    case comedy = 35
    case crime = 80
    case documental = 99
    case drama = 18
    case family = 10751
    case fantasy = 14
    case history = 36
    case horror = 27
    case music = 10402
    case mistery = 9648
    case romance = 10749
    case cienceFiction = 878
    case movieOfTV = 10770
    case suspens = 53
    case war = 10752
    case west = 37
    case ActionAdveture = 10759
    case kids = 10762
    case news = 10763
    case realityShow = 10764
    case Sci_Fi_Fantasy = 10765
}

enum ImageMovieWidthSize: Int {
    case w_200 = 200
    case w_300 = 300
    case w_400 = 400
    case w_500 = 500
}
