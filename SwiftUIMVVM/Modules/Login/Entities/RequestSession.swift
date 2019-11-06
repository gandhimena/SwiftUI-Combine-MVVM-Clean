//
//  RequestSession.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 02/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct RequestSession: Decodable {
    var success: Bool
    var session_id: String
    
    init(success: Bool = false, session_id: String = "") {
        self.success = success
        self.session_id = session_id
    }
}
