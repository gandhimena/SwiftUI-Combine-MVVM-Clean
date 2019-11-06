//
//  Movie.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 24/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct Movie: Decodable, Identifiable {
    var id: Int
    var title: String
    var vote_average: Float
    var overview: String
    var poster_path: String?
    var backdrop_path: String?
    var release_date: String
    var vote_count: Int
    var adult: Bool
  
    init(id: Int = 0,
         title: String = "",
         vote_average: Float = 0.0,
         overview: String = "",
         poster_path: String? = nil,
         backdrop_path: String? = nil,
         release_date: String = "",
         vote_count: Int = 0,
         adult: Bool = false) {
        
        self.id = id
        self.title = title
        self.vote_average = vote_average
        self.overview = overview
        self.poster_path = poster_path
        self.backdrop_path = backdrop_path
        self.release_date = release_date
        self.vote_count = vote_count
        self.adult = adult
    }
    
    func getURLImage(size:ImageMovieWidthSize, type: URLMovieImageType) -> URL {
        var imageType = ""
        switch type {
        case .backdrop:
            imageType = backdrop_path ?? ""
        case .poster:
            imageType = poster_path ?? ""
        }
        return URL(string: "https://image.tmdb.org/t/p/w\(size.rawValue)\(imageType)")!
        
    }
}

enum URLMovieImageType {
    case backdrop
    case poster
}
