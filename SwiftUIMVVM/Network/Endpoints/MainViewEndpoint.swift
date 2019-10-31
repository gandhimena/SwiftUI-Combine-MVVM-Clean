//
//  MainViewRequest.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

enum MainViewRequest: RequestProtocol {
    case getMovies(_ : Media)
    case getImage(_ size: ImageMovieWidthSize,_ path: String)
    case getCast(_ id: MediaCast)
    case getCastDetail(_ id: MediaCastDetail)
}

extension MainViewRequest {
    var baseURL: ServiceEnviroment {
        switch self {
        case .getImage:
            return ServiceEnviroment(protocols: "https://", hosts: "image.tmdb.org", path: "/t/p/w")
        default:
            return ServiceEnviroment(protocols: "https://", hosts: "api.themoviedb.org", path: "/3")
        }
    }
    
    var endpoint: String {
        switch self {
        case .getMovies(let media):
            return "/\(media.mediaType.rawValue)/\(media.mediaRatingType.rawValue)"
        case .getImage(let size, let path):
            return "\(size.rawValue)\(path)"
        case .getCast(let media):
            return "/\(media.mediaType.rawValue)/\(media.movieID)/credits"
        case .getCastDetail(let media):
            return "/\(media.mediaType.rawValue)/\(media.credit_id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        case .getImage:
            return .get
        case .getCast:
            return .get
        case .getCastDetail:
            return .get
            
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .getMovies:
            return .init()
        default:
            return .init()
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .getMovies:
            return .init()
        default:
            return .init()
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getMovies(let media):
            
            return [
                .init(name:"api_key", value: apiKey ),
                .init(name:"language", value: media.language.rawValue),
                .init(name:"page", value: "\(media.page)")
            ]
            
            
        case .getCast:
            return [
            .init(name: "api_key", value: apiKey)
            ]
        case .getCastDetail:
            return [
            .init(name: "api_key", value: apiKey)
            ]
        default:
            return []
        }
    }
}
