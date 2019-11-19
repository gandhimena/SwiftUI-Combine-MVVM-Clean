//
//  ProfileRemoteDataManager.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 06/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

class ProfileRemoteDataManager: ProfileRemoteDataManagerProtocol {
    var requestService: RequestServiceProtocol
    var persistance: PersistanceProtocol
    
    init(requestService: RequestServiceProtocol = RequestService(),
         persistance: PersistanceProtocol = Persistance()) {
        self.requestService = requestService
        self.persistance = persistance
    }
    
    func createRequestToken(_ toggle: Bool) -> AnyPublisher<RequestToken, Error> {
        let result = requestService.fetchData(request: ListEndPoints.createRequestToken(toggle)) as AnyPublisher<RequestToken, Error>
        return result.eraseToAnyPublisher()
    }
    
    func createAccessToken(_ requestToken: String) -> AnyPublisher<AccessToken, Error> {
        let result = requestService.fetchData(request: ListEndPoints.createAccessToken(requestToken)) as AnyPublisher<AccessToken, Error>
        return result.eraseToAnyPublisher()
    }
    
    func createList(_ mediaCreateList: MediaCreateList) -> AnyPublisher<CreateListResponse, Error> {
        let accessToken = persistance.getKeychain(key: .keychain_access_token)!
        let result = requestService.fetchData(request: ListEndPoints.createList(mediaCreateList, accessToken)) as AnyPublisher<CreateListResponse, Error>
        return result.eraseToAnyPublisher()
    }
    
    func getCreatedLists() -> AnyPublisher<MyLists, Error> {
        let acocuntId = persistance.getKeychain(key: .keychain_accountID) ?? ""
        let result = requestService.fetchData(request: ListEndPoints.getcreatedLists(acocuntId)) as AnyPublisher<MyLists, Error>
        return result.eraseToAnyPublisher()
    }
    
    func getList(_ listID: Int, page: Int) -> AnyPublisher<MyMediaList, Error> {
        let result = requestService.fetchData(request: ListEndPoints.getList(listID, page)) as AnyPublisher<MyMediaList, Error>
        return result.eraseToAnyPublisher()
    }
}
