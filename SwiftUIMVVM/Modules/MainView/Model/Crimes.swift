//
//  Crimes.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct Crimes: Decodable {
    var nhits: Int
    var parameters: SearchParameters
    var records: [Records]
    
    init(nhits: Int = 0,parameters: SearchParameters = SearchParameters(), records: [Records] = []) {
        self.nhits = nhits
        self.parameters = parameters
        self.records = records
    }
}
