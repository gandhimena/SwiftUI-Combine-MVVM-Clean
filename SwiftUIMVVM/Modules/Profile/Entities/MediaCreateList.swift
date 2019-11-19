//
//  MediaCreateList.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 07/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct MediaCreateList {
    var name: String
    var description: String?
    
    init(name: String, description: String? = nil) {
        self.name = name
        self.description = description
    }
}
