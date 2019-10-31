//
//  ProductionCompany.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 28/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct ProductionCompay: Decodable {
    var logo_path: String
    var name: String
    
    init(logo_path: String = "", name: String = "") {
        self.logo_path = logo_path
        self.name = name
    }
}
