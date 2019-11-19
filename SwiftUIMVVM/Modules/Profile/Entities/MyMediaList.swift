//
//  MyMediaList.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 07/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct MyMediaList: Decodable {
    var id: Int
    var name: String
    var description: String?
    var total_results: Int
    var results: [Movie]
    
    init(id: Int = 0,
         name: String = "",
         description: String? = nil,
         total_results: Int = 0,
         results: [Movie] = []) {
        
        self.id = id
        self.name = name
        self.description = description
        self.total_results = total_results
        self.results = results
    }
    
}
