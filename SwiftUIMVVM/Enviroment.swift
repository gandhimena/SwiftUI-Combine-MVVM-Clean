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
            return ServiceEnviroment(protocols: "https://", hosts: "api.letsbuildthatapp.com/static")
        case .prod:
            return ServiceEnviroment(protocols: "https://", hosts: "datos.cdmx.gob.mx/", path: "api/records/1.0/search/?dataset=carpetas-de-investigacion-pgj-de-la-ciudad-de-mexico&rows=1&refine.ao_hechos=2019&refine.delito=ABUSO+SEXUAL")
        }
    }
    
    func baseURL(endpoint: String) -> String {
        return self.env.baseURL(endpont: endpoint)
    }
}
