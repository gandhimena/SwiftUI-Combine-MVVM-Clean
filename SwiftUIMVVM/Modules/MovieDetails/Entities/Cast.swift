//
//  Cast.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct Cast: Decodable, Identifiable {
    var id: Int
    var profile_path: String?
    var name: String
    var character: String
    var credit_id: String
    
    init(id: Int = 0, profile_path: String? = nil, name: String = "", character: String = "", credit_id: String = "") {
        self.id = id
        self.profile_path = profile_path
        self.name = name
        self.character = character
        self.credit_id = credit_id
    }
    
}
