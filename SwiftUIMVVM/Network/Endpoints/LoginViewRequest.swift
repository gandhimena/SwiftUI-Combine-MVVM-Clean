//
//  LoginViewRequest.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 02/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

enum LoginViewRequest: RequestProtocol {
    case createRequestToken
    case login(_ credential: Credential, _ requestToken: String)
    case createSession (_ requestToken: String)
    
}

extension LoginViewRequest {
    var baseURL: ServiceEnviroment {
        switch self {
        default:
            return ServiceEnviroment(protocols: "https://", hosts: "api.themoviedb.org", path: "/3")
        }
    }
       
    var endpoint: String {
        switch self {
        case .createRequestToken:
            return "/authentication/token/new"
        case .login:
            return "/authentication/token/validate_with_login"
        case .createSession:
            return "/authentication/session/new"
        }
    }
       
    var httpMethod: HTTPMethod {
        switch self {
        case .createRequestToken:
            return .get
        case .login:
            return .post
        case .createSession:
            return .post
        }
    }
       
    var parameters: [String : Any] {
        switch self {
        case .createRequestToken:
            return .init()
        case .login(let credential, let requestToken):
            return [
              "username": credential.username,
              "password": credential.password,
              "request_token": requestToken
            ]
        case .createSession(let requestToken ):
            return ["request_token": requestToken]
        }
        
    }
       
    var headers: [String : String] {
        switch self {
        case .login, .createSession:
            return ["content-type": "application/json"]
        default:
            return .init()
        }
    }
       
    var queryItems: [URLQueryItem] {
        switch self {
        default:
            return [
                .init(name: "api_key", value: apiKey )
            ]
        }
    }
}
