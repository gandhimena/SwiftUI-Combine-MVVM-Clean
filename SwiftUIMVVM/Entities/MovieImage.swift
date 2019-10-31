//
//  MovieImage.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 26/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct MoviesResponse: Decodable {

    var movieImages: [MovieImage]
    var movies: [Movie]
    
    init(movies: [Movie] = [], movieImages: [MovieImage] = []) {
        self.movies = movies
        self.movieImages = movieImages
    }
}

struct MovieImage: Identifiable, Decodable {
    var id: Int
    var data: Data
    
    init(id: Int = 0, data: Data = Data()) {
        self.id = id
        self.data = data
    }
}
