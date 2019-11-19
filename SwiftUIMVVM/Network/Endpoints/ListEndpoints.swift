//
//  ListEndpoints.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 07/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

enum ListEndPoints: RequestProtocol {
    case createRequestToken(_ toggle: Bool)
    case createAccessToken(_ requesToken: String)
    case createList(_ createList: MediaCreateList, _ accessToken: String)
    case getcreatedLists(_ account_id: String)
    case getList(_ listID: Int, _ page: Int)
    case updateList(_ with: MediaUpdateList)
    case deleteList(_ listID: Int)
}

extension ListEndPoints {
    var baseURL: ServiceEnviroment {
        switch self {
            
        default:
            return ServiceEnviroment(port: "", protocols: "https://", hosts: "api.themoviedb.org", path: "/4")
        }
    }
    
    var endpoint: String {
        switch self {
        case .createRequestToken:
            return "/auth/request_token"
            
        case .createAccessToken:
            return "/auth/access_token"
            
        case .createList:
            return "/list"
            
        case .getcreatedLists(let account_id):
            return "/account/\(account_id)/lists"
            
        case .getList(let listID, _):
            return "/list/\(listID)"
            
        case .updateList(let mediaUpdate):
            return "/list/\(mediaUpdate.listID)"
            
        case .deleteList(let listID):
            return "/list/\(listID)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .createRequestToken:
            return .post
        case .createAccessToken:
            return .post
        case .createList:
            return .post
        case .getcreatedLists:
            return .get
        case .getList:
            return .get
        case .updateList:
            return .put
        case .deleteList:
            return .delete
            
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .createRequestToken(let toggle):
            return toggle ? [:] : ["redirect_to": ""]
        case .createAccessToken(let requestToken):
            return [
                "request_token": requestToken
            ]
        case .createList(let mediaList, _):
            return [
                "name": mediaList.name,
                "description": mediaList.description ?? "",
                "iso_639_1": "en"
            ]
        case .getcreatedLists:
            return .init()
        case .getList:
            return .init()
        case .updateList(let updateList):
            return [
                "name": updateList.name,
                "description": updateList.description ?? ""
            ]
        case .deleteList:
            return .init()
            
        }
    }
    
    var headers: [String : String] {
        switch self {
            
        case .createRequestToken:
            return [
              "content-type": "application/json;charset=utf-8",
              "authorization": "Bearer \(accessToken)"
            ]
        
        case .createAccessToken:
            return [
              "content-type": "application/json;charset=utf-8",
              "authorization": "Bearer \(accessToken)"
            ]
            
        case .getcreatedLists:
            return ["authorization": "Bearer \(accessToken)"]
            
        case .getList:
            return [
              "content-type": "application/json;charset=utf-8",
              "authorization": "Bearer \(Persistance().getKeychain(key: .keychain_access_token) ?? "")"
            ]
        case .createList(_ , let accessToken):
            return [
              "authorization": "Bearer \(accessToken))",
              "content-type": "application/json;charset=utf-8"
            ]
        case .updateList:
            return [
              "content-type": "application/json;charset=utf-8",
              "authorization": "Bearer \(Persistance().getKeychain(key: .keychain_access_token) ?? "")"
            ]
        case .deleteList:
            return [
              "content-type": "application/json;charset=utf-8",
              "authorization": "Bearer \(Persistance().getKeychain(key: .keychain_access_token) ?? "")"
            ]
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getList(_, let page):
            return [
                .init(name: "page", value: "\(page)")
            ]
        case .createList:
            return [
                .init(name: "api_key", value: apiKey)
            ]
        default:
            return .init()
        }
    }
}
