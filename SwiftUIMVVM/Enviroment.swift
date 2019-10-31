//
//  Enviroment.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

enum Enviroment {
    case dev
    case prod
}

extension Enviroment {
    
    var env: ServiceEnviroment {
        switch self {
        case .dev:
            return ServiceEnviroment(protocols: "https://", hosts: "api.themoviedb.org", path: "/3")
        case .prod:
            return ServiceEnviroment(protocols: "https://", hosts: "api.themoviedb.org", path: "/3")
        }
    }
    
    func baseURL(endpoint: String) -> String {
        return self.env.pathURL(endpont: endpoint)
    }
}
