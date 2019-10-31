//
//  ActorDetailViewModel.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 30/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

class ActorDetailViewModel: ObservableObject {
    
    internal var cancellables: [AnyCancellable] = []
    
    internal let mainViewService: MainViewManagerProtocol
    
//    @Published var known_for: [CastMovie] = []
    @Published var castData: CastData = CastData()
    
    var castID: String
    
    init(castID: String, mainViewService: MainViewManagerProtocol = MainViewManager()) {
        self.castID = castID
        self.mainViewService = mainViewService
        
        getActorInfo()
    }
    
    func getActorInfo() {
        let mediaCastDetail = MediaCastDetail(mediaType: .credit, credit_id: castID)
        let responsePublisher = mainViewService.getCastDetail(mediaCastDetail)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("get castDetail Finished")
                }
            }) { castDetail in
                self.castData = castDetail.person
        }
        
        cancellables += [
            responsePublisher
        ]
    }
    
    
}
