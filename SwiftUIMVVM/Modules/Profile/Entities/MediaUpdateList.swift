//
//  MediaUpdateList.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 07/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct MediaUpdateList {
    var listID: Int
    var name: String
    var description: String?
    
    init(listID: Int, name: String, description: String? = nil) {
        self.listID = listID
        self.name = name
        self.description = description
    }
}
