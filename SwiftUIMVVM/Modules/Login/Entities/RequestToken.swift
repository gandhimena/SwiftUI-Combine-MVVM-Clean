//
//  RequestToken.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 02/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct RequestToken: Decodable {
    var status_code: Int?
    var status_message: String?
    var success: Bool
    var request_token: String
    
    init(status_code: Int? = nil, status_message: String? = nil, success: Bool = false, request_token: String = "") {
        self.status_code = status_code
        self.status_message = status_message
        self.success = success
        self.request_token = request_token
    }
}

