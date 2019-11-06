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
}

class LoginViewModel: ObservableObject, LoginViewModelProtocol {
    private var cancellables: [AnyCancellable?] = []
    
    @Published var errorMessage = ""
    @Published var isSessionCreated: Bool = false
    @Published var username = ""
    @Published var password = ""
    @Published var isLoginSuccess: Bool = false
    
    private var requestToken = ""
    
    internal var manager: LoginRemoteDataManagerProtocol?
    
    init(manager: LoginRemoteDataManagerProtocol = LoginRemoteDataManager() ) {
        self.manager = manager
    }
    
    func login() {
        
        let credential = Credential(username: username, password: password)
        let responsePublisher = manager?.login(credential, self.requestToken)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
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
    
    func createRequestToken() {
        let responsePublisher = manager?.getRequestToken()
            .sink(receiveCompletion: { response in
                switch response {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    print("create Request token was success")
                }
            }, receiveValue: { request in
                self.requestToken = request.request_token
            })
        
        cancellables += [
            responsePublisher
        ]
    }
    
    func createSession() {
        let responsePublisher = manager?.createSession(self.requestToken)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                case .finished:
                    print("Sesison created")
                }
            }, receiveValue: { response in
                print(response)
                self.isSessionCreated = true
            })
        
        cancellables += [responsePublisher]
    }
    
    
}
