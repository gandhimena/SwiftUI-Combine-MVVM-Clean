//
//  CoursesViewModel.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 19/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class PopularMovieViewMmodel: ObservableObject, CrimeViewMmodelProtocol {
    
    private var cancellables: [AnyCancellable] = []
    @Published private(set) var state: ViewState = .idle
    @Published var isAlertPresented: Bool = false
    @Published var messageError = ""
    @Published var movies: [Movie] = []
    private var page:Int = 0
    private var offset:Int = 10
    @Published var movieImage: [MovieImage] = []
    @Published var dataIsValid = false
    @Published var data: Data = Data()
    
    private static let cache = Cache<String, Movie>()
    
    internal let mainViewService: MainViewManagerProtocol
    internal var loadingState: LoadingStateProtocol
    
    var ratingType: MediaRatingType
    
    init(ratingType: MediaRatingType, mainViewService: MainViewManagerProtocol = MainViewManager(),
         loading: LoadingStateProtocol = LoadingState() ) {
        self.ratingType = ratingType
        self.mainViewService = mainViewService
        self.loadingState = loading
        getMovies(ratingType: ratingType)
    }
    
    func getMovies(ratingType: MediaRatingType) {
        loadingState.isLoading = true
        
        self.page += 1
        let media = Media(mediaType: .movie, mediaRatingType: ratingType, page: self.page)
        
        let responsePublisher = mainViewService.getMovies(media)
            .sink(receiveCompletion: { [weak self] completion in
                self?.loadingState.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.isAlertPresented = true
                    self?.messageError = error.localizedDescription
                case .finished:()
                }
            }){ response in
                self.movies = response.results
            }
        
        cancellables += [
            responsePublisher
        ]
    }
    
    func listItemAppears<Movie: Identifiable>(_ item: Movie) {
        if movies.isThresholdItem(offset: offset, item: item) {
//            loadingState.isLoading = true
            DispatchQueue.main.async {
                self.page += 1
                let media = Media(mediaType: .movie, mediaRatingType: self.ratingType, page: self.page)
                print("page Count: \(media.page)")
                self.getMoreMovies(media: media)
            }
        }
    }
    
    func getMoreMovies(media: Media) {
            let responsePublisher = mainViewService.getMovies(media)
                .sink(receiveCompletion: { [weak self] completion in
//                    self?.loadingState.isLoading = false
                    switch completion {
                    case .failure(let error):
                        self?.isAlertPresented = true
                        self?.messageError = error.localizedDescription
                    case .finished:()
                    }
                }){ response in
                    self.movies.append(contentsOf: response.results)
                    
                }
            
            cancellables += [
                responsePublisher
            ]
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    func isThresholdItem<Item: Identifiable>(offset: Int, item: Item) -> Bool {
        guard !isEmpty else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else { return false }
        let distance = self.distance(from: itemIndex, to: endIndex)
        print("offsets: \(offset) distance: \(distance - 1), count: \(count - 1), item: \(itemIndex)")
        let offset = offset < count ? offset : count - 1
        return offset == (distance - 1)
//        return distance <= 5
        
    }
}

