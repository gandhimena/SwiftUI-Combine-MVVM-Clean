//
//  Records.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct Records: Decodable {
    var fields: Fields
    
    init(fields: Fields = Fields() ) {
        self.fields = fields
    }
}

struct Fields: Decodable {
    var mes_hechos: String
    var categoria_delito: String
    
    init(mes_hechos: String = "", categoria_delito: String = "") {
        self.mes_hechos = mes_hechos
        self.categoria_delito = categoria_delito
    }
    
}
