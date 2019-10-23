//
//  Categories.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct Categories: Decodable {
    var ao_hechos: String
    var delito: String
    
    init(ao_hechos: String = "", delito: String = "") {
        self.ao_hechos = ao_hechos
        self.delito = delito
    }
}
