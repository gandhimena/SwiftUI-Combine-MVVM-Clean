//
//  AuthToken.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 31/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct AuthToken: Decodable {
    var success: Bool
    var expires_at: String
    var request_token: String
}
