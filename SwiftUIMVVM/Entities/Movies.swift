//
//  Movies.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 24/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    var page: Int
    var total_results: Int
    var total_pages: Int
    var results: [Movie]
    
    
    init(page: Int = 0, total_results: Int = 0, total_pages: Int = 0, result: [Movie] = []) {
     
        self.page = page
        self.total_results = total_results
        self.total_pages = total_pages
        self.results = result
    }
}
