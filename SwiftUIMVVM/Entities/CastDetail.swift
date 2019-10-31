//
//  CastDetail.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct CastDetail: Decodable {
    var person: CastData
    
    init(person: CastData) {
        self.person = person
    }
}
