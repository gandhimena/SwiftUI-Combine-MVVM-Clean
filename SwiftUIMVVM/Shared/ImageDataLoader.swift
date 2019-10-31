//
//  ImageData.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 27/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

protocol ImageDataLoaderProtocol {
    init(imageURL: String?, imageSize: ImageMovieWidthSize)
    var image: UIImage { get set }
}

final class ImageDataLoader: ObservableObject, ImageDataLoaderProtocol {
    
    private static let cache = Cache<String, UIImage>()
    
    private var cancellables: [AnyCancellable] = []
    internal var requestService: RequestServiceProtocol = RequestService()
    
    @Published var image: UIImage = UIImage()

    private let imageURL: String
    required init(imageURL: String?, imageSize: ImageMovieWidthSize) {
        self.imageURL = imageURL ?? ""
        getImage(imageSize: imageSize)
    }
    
    func getImage(imageSize: ImageMovieWidthSize) {
        
        self.image = UIImage(named: "movieImageDefault")!
        
        if let imageFromCache = ImageDataLoader.cache.value(forKey: self.imageURL) {
            self.image = imageFromCache
            return
        }
        
        let responsePublisher = self.getMoviewImage(imageSize: imageSize, urlString: self.imageURL)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finish")
                }
            }) { data in
                DispatchQueue.main.async {
                    guard let image = UIImage(data: data) ?? UIImage(named: "userDefualt") else { return }
                    ImageDataLoader.cache.insert(image, forKey: self.imageURL)
                    self.image = image
                }
        }
        
        self.cancellables += [
            responsePublisher
        ]
    }
    
    private func getMoviewImage(imageSize: ImageMovieWidthSize, urlString: String) -> AnyPublisher<Data, Error> {
        let result = requestService.fetchImage(request: MainViewRequest.getImage(imageSize, urlString)) as AnyPublisher<Data, Error>
        return result
            .map {$0}
            .eraseToAnyPublisher()
    }
    
}

