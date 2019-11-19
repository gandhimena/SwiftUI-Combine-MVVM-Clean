//
//  MyLists.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 07/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct MyLists: Decodable {
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [MyMediaList]
    
    init(page: Int? = nil,
         total_results: Int? = nil,
         total_pages: Int? = nil,
         results: [MyMediaList] = []) {
        
        self.page = page
        self.total_results = total_results
        self.total_pages = total_pages
        self.results = results
    }
}
