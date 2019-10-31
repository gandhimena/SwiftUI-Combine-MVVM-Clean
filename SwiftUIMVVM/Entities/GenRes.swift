//
//  GenRes.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 28/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct GenRes: Decodable {
    var id: Int
    var name: String
    
    init(id: Int = 0, name: String = "") {
        self.id = id
        self.name = name
    }

}
