//
//  AccessToken.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 08/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct AccessToken: Decodable {
    var success: Bool?
    var access_token: String?
    var status_code: Int?
    var status_message: String?
    var account_id: String?
    
    init(success: Bool? = nil,
         access_token: String? = nil,
         status_code: Int? = nil,
         status_message: String? = nil,
         account_id: String? = nil ) {
        
        self.success = success
        self.access_token = access_token
        self.status_code = status_code
        self.status_message = status_message
        self.account_id = account_id
    }
}
