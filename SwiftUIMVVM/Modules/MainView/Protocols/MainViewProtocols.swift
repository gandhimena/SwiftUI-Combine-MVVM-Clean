//
//  MainViewProtocols.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

protocol ContentViewProtocol {
    var movieViewModel: PopularMovieViewMmodel { get }
}

protocol MainViewManagerProtocol {
    var requestService: RequestServiceProtocol { get }
    func getMovies(_ media: Media) -> AnyPublisher<Movies, Error>
    func getMoviewImage(imageSize: ImageMovieWidthSize, urlString: String) -> AnyPublisher<Data, Error>
    func getCast(_ mediaCast: MediaCast) -> AnyPublisher<MovieCast, Error>
    func getCastDetail(_ mediaCastDetail: MediaCastDetail) -> AnyPublisher<CastDetail, Error>
}

protocol CrimeViewMmodelProtocol {
    var mainViewService: MainViewManagerProtocol { get }
    func getMoreMovies(media: Media)
    func getMovies(ratingType: MediaRatingType)
}
