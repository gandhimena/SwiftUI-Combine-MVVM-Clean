//
//  MainViewAPI.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

struct MainViewManager: MainViewManagerProtocol {
    
    internal var requestService: RequestServiceProtocol
    
    init(requestService: RequestServiceProtocol = RequestService()  ) {
        self.requestService = requestService
    }
    
    func getCimes() -> AnyPublisher<Crimes, Error> {
        let result = requestService.fetchData(request: MainViewRequest.getCrimes) as AnyPublisher<Crimes, Error>
        return result
//            .print()
            .map { $0 }
            .eraseToAnyPublisher()
    }
}
