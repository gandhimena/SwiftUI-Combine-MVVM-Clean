//
//  ProfileProtocols.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 06/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

protocol ProfileRemoteDataManagerProtocol: class {
    
    var requestService: RequestServiceProtocol { get set }
    var persistance: PersistanceProtocol { get set }
    
    func createRequestToken(_ toggle: Bool) -> AnyPublisher<RequestToken, Error>
    func createAccessToken(_ requestToken: String) -> AnyPublisher<AccessToken, Error>
    func createList(_ mediaCreateList: MediaCreateList) -> AnyPublisher<CreateListResponse, Error>
    func getCreatedLists() -> AnyPublisher<MyLists, Error>
    func getList(_ listID: Int, page: Int) -> AnyPublisher<MyMediaList, Error>

}
