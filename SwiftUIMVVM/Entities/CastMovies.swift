//
//  CastMovies.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct CastMovie: Decodable, Identifiable {
    var id: Int
    var poster_path: String
    var title: String
    var vote_average: Float
    
    init(id: Int, poster_path: String = "", title: String = "", vote_average: Float = 0.0) {
        self.id = id
        self.poster_path = poster_path
        self.title = title
        self.vote_average = vote_average
    }
}
