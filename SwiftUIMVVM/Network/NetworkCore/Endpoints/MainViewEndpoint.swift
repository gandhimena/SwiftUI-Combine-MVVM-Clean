//
//  MainViewRequest.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

enum MainViewRequest: RequestProtocol {
    case getCrimes
}

extension MainViewRequest {
    var endpoint: String {
        switch self {
        case .getCrimes:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getCrimes:
            return .get
            
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .getCrimes:
            return .init()
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .getCrimes:
            return .init()
        }
    }
}
