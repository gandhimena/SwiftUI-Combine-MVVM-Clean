//
//  ProfileViewModel.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 06/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    internal var cancellables: [AnyCancellable] = []
    
    @Published var isSettingsShow: Bool = false
    @Published var isLogoutSuccess: Bool = false
    @Published var isAccountIDSuccess: Bool = false
    @Published var isAlertPresented: Bool = false
    @Published var isCreateNewListShow: Bool = false
    
    private var requesToken: String = ""
    private var toggleForRequestToken: Bool = false
    
    var remoteManager: ProfileRemoteDataManagerProtocol
    var persistance: PersistanceProtocol
    
    init(remoteManager: ProfileRemoteDataManagerProtocol = ProfileRemoteDataManager() ,
         persistance: PersistanceProtocol = Persistance()) {
        self.remoteManager = remoteManager
        self.persistance = persistance
    }
    
    func createRequestToken() {
        let responsePublisher = remoteManager.createRequestToken(toggleForRequestToken)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("request token success")
                }
            }) {[ weak self] response in
                print("Request token: \(response)")
                self?.requesToken = response.request_token
                self?.createAccessToken(response.request_token)
        }
        
        cancellables += [
            responsePublisher
        ]
    }
    
    func createAccessToken(_ requestToken: String) {
        guard self.persistance.getKeychain(key: .keychain_accountID) == nil  else {
            self.isCreateNewListShow = true
            self.createNewList()
            return 
        }
        
        let responsePublisher = remoteManager.createAccessToken(requestToken)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            }) { [weak self] response in
                guard let success = response.success, success != false else {
                    self?.isAlertPresented = true
                    self?.toggleForRequestToken.toggle()
                    return
                }
                self?.persistance.setKeychain(data: response.access_token, .keychain_access_token)
                self?.persistance.setKeychain(data: response.account_id, .keychain_accountID)
                self?.isCreateNewListShow = true
                self?.createNewList()
        }
        
        cancellables += [responsePublisher]
    }
    
    func authorizeToken() {
        guard !requesToken.isEmpty else { isAlertPresented = true; return }
        let url = URL(string: "https://www.themoviedb.org/auth/access?request_token=\(self.requesToken)")
        UIApplication.shared.open(url!)
    }
    
    func createNewList() {
        let mediaCreateList = MediaCreateList(name: "Title1", description: "desciption1")
        let resultPublisher = remoteManager.createList(mediaCreateList)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("createNewList request finish")
                }
            }) { response in
                print("Create new List: \(response.success ?? "")")
                
                //add mediaCerateList to list
        }
        
        cancellables += [resultPublisher]
        
    }
    
    func myRequest() {
        
        let url = URL(string: "https://www.themoviedb.org/account/reset-password")
        UIApplication.shared.open(url!)
    }
    
    func logout() {
        self.persistance.deleteAllKeyChains()
        self.isLogoutSuccess = false
    }
    
}
