//
//  CreateListResponse.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 07/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct CreateListResponse: Decodable {
    var status_code: Int?
    var status_message: String?
    var success: String?
    var id: Int
    
    init(status_code: Int? = nil,
         status_message: String? = nil,
         success: String? = nil,
         id: Int = 0 ) {
        
        self.status_code = status_code
        self.status_message = status_message
        self.success = success
        self.id = id
    }
}
