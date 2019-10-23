//
//  RequestService.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

protocol RequestServiceProtocol {
    var enviroment: Enviroment { get }
    
    func fetchData<T: Decodable>(request: RequestProtocol) -> AnyPublisher<T, Error>
    func getURLRequest(urlString: String) -> URLRequest?
    func configRequestMethods(request: RequestProtocol, urlRequest: inout URLRequest)
    func urlSessionRequest<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error>
}

struct RequestService: RequestServiceProtocol {
    internal let enviroment: Enviroment
    
    init(enviroment: Enviroment = Enviroment.prod ) {
        self.enviroment = enviroment
    }
    
    func fetchData<T: Decodable>(request: RequestProtocol) -> AnyPublisher<T, Error> {
        let urlString =  enviroment.baseURL(endpoint: request.endpoint)
        guard var urlRequest = getURLRequest(urlString: urlString) else { preconditionFailure("can't create url")}
        configRequestMethods(request: request, urlRequest: &urlRequest)
        return urlSessionRequest(urlRequest: urlRequest)
    }
    
    internal func getURLRequest(urlString: String) -> URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }
    
    internal func configRequestMethods(request: RequestProtocol, urlRequest: inout URLRequest) {
        switch request.httpMethod {
        case .post:
            request.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
            urlRequest.httpMethod = request.httpMethod.rawValue
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: request.parameters, options: .prettyPrinted)
        case .get:()
        case .patch:()
        case .put:()
        }
    }
    
    internal func urlSessionRequest<T: Decodable>(urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
//        .print()
        .map { $0.data }
        .mapError(ServiceError.responseError)
        .decode(type: T.self, decoder: JSONDecoder())
        .mapError(ServiceError.parseError)
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }

}

