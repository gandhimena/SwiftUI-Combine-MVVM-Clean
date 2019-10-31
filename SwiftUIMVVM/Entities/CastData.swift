//
//  CastData.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct CastData: Decodable {
    var name: String
    var profile_path: String
    var known_for: [CastMovie]
    var popularity: Float
    
    init(name: String = "", profile_path: String = "", known_for: [CastMovie] = [], popularity: Float = 0.0) {
        self.name = name
        self.profile_path = profile_path
        self.known_for = known_for
        self.popularity = popularity
    }
    
    
}
