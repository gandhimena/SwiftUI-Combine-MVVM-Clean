//
//  MainViewAPI.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

struct MainViewManager: MainViewManagerProtocol {
    
    internal var requestService: RequestServiceProtocol
    
    init(requestService: RequestServiceProtocol = RequestService()  ) {
        self.requestService = requestService
    }
    
    func getMovies(_ media: Media) -> AnyPublisher<Movies, Error> {
        let result = requestService.fetchData(request: MainViewRequest.getMovies(media)) as AnyPublisher<Movies, Error>
        return result
//            .print()
            .map {$0}
            .eraseToAnyPublisher()
    }
    
    func getMoviewImage(imageSize: ImageMovieWidthSize, urlString: String) -> AnyPublisher<Data, Error> {
        let result = requestService.fetchImage(request: MainViewRequest.getImage(imageSize, urlString)) as AnyPublisher<Data, Error>
        return result
//            .print()
            .map {$0}
            .eraseToAnyPublisher()
    }
    
    func getCast(_ mediaCast: MediaCast) -> AnyPublisher<MovieCast, Error> {
        let request = requestService.fetchData(request: MainViewRequest.getCast(mediaCast)) as AnyPublisher<MovieCast, Error>
        return request
//        .print()
            .map {$0}
            .eraseToAnyPublisher()
    }
    
    func getCastDetail(_ mediaCastDetail: MediaCastDetail) -> AnyPublisher<CastDetail, Error> {
        let request = requestService.fetchData(request: MainViewRequest.getCastDetail(mediaCastDetail)) as AnyPublisher<CastDetail, Error>
        return request
//            .print()  
            .map {$0}
            .eraseToAnyPublisher()
    }
}
