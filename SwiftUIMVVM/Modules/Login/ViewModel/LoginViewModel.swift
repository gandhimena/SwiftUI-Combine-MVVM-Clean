//
//  LoginViewModel.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 31/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

protocol LoginViewModelProtocol: class {
    var manager: LoginRemoteDataManagerProtocol? { get set }
    var persistance: PersistanceProtocol? { get set }
}

class LoginViewModel: ObservableObject, LoginViewModelProtocol {
    private var cancellables: [AnyCancellable?] = []
    
    var persistance: PersistanceProtocol?
    
    @Published var errorMessage = ""
    @Published var isSessionCreated: Bool = false
    @Published var username = ""
    @Published var password = ""
    @Published var isLoginSuccess: Bool = false
    @Published var isTabBarActive: Bool = false
    @Published var isAlertPresented: Bool = false
    
    private var requestToken = ""
    
    internal var manager: LoginRemoteDataManagerProtocol?
    
    init(manager: LoginRemoteDataManagerProtocol = LoginRemoteDataManager(),
         persistance: PersistanceProtocol = Persistance() ) {
        self.manager = manager
        self.persistance = persistance
    }
    
    func createRequestToken() {
        let responsePublisher = manager?.getRequestToken()
            .sink(receiveCompletion: { [weak self] response in
                switch response {
                case .failure(let error):
                    self?.isAlertPresented = true
                    self?.errorMessage = error.localizedDescription
                    print(error)
                case .finished:
                    print("create Request token was success")
                }
            }, receiveValue: { request in
                self.requestToken = request.request_token
                self.login()
            })
        
        cancellables += [
            responsePublisher
        ]
    }
    
    func login() {
        let credential = Credential(username: username, password: password)
        let responsePublisher = manager?.login(credential, self.requestToken)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self?.isAlertPresented = true
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    print("Login success")
                }
            }, receiveValue: { requestToken in
                self.isLoginSuccess = requestToken.success
                self.requestToken = requestToken.request_token
                self.createSession()
            })
        
        cancellables += [responsePublisher]
    }
    
    func createSession() {
        let responsePublisher = manager?.createSession(self.requestToken)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.isAlertPresented = true
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    print("Sesison created")
                }
            }, receiveValue: { response in
                print(response.session_id)
                self.isSessionCreated = true
                self.persistance?.setKeychain(data: response.session_id, .keychain_sessionID)
            })
        
        cancellables += [responsePublisher]
    }
}
