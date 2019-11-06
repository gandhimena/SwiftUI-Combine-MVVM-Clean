//
//  Credential.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 04/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct Credential {
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
