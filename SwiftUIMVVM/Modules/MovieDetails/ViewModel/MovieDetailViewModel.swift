//
//  MovieDetailViewModel.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    
    internal var cancellables: [AnyCancellable] = []
    
    internal let mainViewService: MainViewManagerProtocol
    
    @Published var cast: [Cast] = []
    
    var movieID: Int
    
    init(movieID: Int, mainViewService: MainViewManagerProtocol = MainViewManager()) {
        self.movieID = movieID
        self.mainViewService = mainViewService
        
        getCast()
    }
    
    func getCast() {
        let mediaCast = MediaCast(mediaType: .movie, movieID: self.movieID)
        let responsePublisher = mainViewService.getCast(mediaCast)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("\(error.localizedDescription)")
                case .finished:
                    print("download cast finished")
                }
            }) { [weak self] movieCast in
                self?.cast = movieCast.cast
        }
        
        cancellables += [
            responsePublisher
        ]
    }
}
