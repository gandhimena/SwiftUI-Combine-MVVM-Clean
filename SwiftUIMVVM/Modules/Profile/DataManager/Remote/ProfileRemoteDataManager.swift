//
//  ProfileRemoteDataManager.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 06/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

class ProfileRemoteDataManager: ProfileRemoteDataManagerProtocol {
    var requestService: RequestServiceProtocol?
    
    init(requestService: RequestServiceProtocol = RequestService()) {
        self.requestService = requestService
    }
}
