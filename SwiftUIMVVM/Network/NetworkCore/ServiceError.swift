//
//  ServiceError.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case responseError(Error)
    case parseError(Error)
    case badURL
    
    var description: String {
        switch self {
        case .responseError:
            return "response error"
        case .parseError(let error):
            return "parse error \(error)"
        default:
            return ""
        }
    }
}
