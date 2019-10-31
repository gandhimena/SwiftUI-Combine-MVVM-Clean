//
//  MovieCast.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct MovieCast: Decodable {
    
    var id: Int
    var cast: [Cast]
    
    init(id: Int, cast: [Cast]) {
        self.id = id
        self.cast = cast
    }
    
    
}
