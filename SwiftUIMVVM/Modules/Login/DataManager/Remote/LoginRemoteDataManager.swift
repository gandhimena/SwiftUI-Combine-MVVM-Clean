//
//  LoginRemoteDataManager.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 31/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

protocol LoginRemoteDataManagerProtocol {
    var requestService: RequestServiceProtocol { get set }
    func getRequestToken() -> AnyPublisher<RequestToken, Error>
    func createSession(_ requestToken: String) -> AnyPublisher<RequestSession, Error>
    func login(_ credential: Credential, _ requestToken: String) -> AnyPublisher<RequestToken, Error>
}

final class LoginRemoteDataManager: LoginRemoteDataManagerProtocol {
    
    internal var requestService: RequestServiceProtocol
    
    init(_ requestService: RequestServiceProtocol = RequestService()) {
        self.requestService = requestService
    }
    
    func login(_ credential: Credential, _ requestToken: String) -> AnyPublisher<RequestToken, Error> {
        let result = requestService.fetchData(request: LoginViewRequest.login(credential, requestToken)) as AnyPublisher<RequestToken, Error>
        return result
        .map {$0}
        .eraseToAnyPublisher()
    }
    
    func getRequestToken() -> AnyPublisher<RequestToken, Error> {
        let result = requestService.fetchData(request: LoginViewRequest.createRequestToken) as AnyPublisher<RequestToken, Error>
        return result
            .map {$0}
            .eraseToAnyPublisher()
    }
    
    func createSession(_ requestToken: String) -> AnyPublisher<RequestSession, Error> {
        let result = requestService.fetchData(request: LoginViewRequest.createSession(requestToken)) as AnyPublisher<RequestSession, Error>
        return result
            .print()
            .map {$0}
            .eraseToAnyPublisher()
    }
    
}
