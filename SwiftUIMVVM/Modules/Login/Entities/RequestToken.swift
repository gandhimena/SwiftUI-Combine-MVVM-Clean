//
//  RequestToken.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 02/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct RequestToken: Decodable {
    var success: Bool
    var expires_at: String
    var request_token: String
    
    init(success: Bool = false, expires_at: String = "", request_token: String = "") {
        self.success = success
        self.expires_at = expires_at
        self.request_token = request_token
    }

}

