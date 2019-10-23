//
//  CoursesViewModel.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 19/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import Combine

class CrimeViewMmodel: ObservableObject, CrimeViewMmodelProtocol {
    
    private var cancellables: [AnyCancellable] = []
    @Published var crimes: Crimes = Crimes()
    @Published private(set) var state: ViewState = .idle
    @Published var isAlertPresented: Bool = false
    @Published var messageError = ""
    
    internal let responseObject = PassthroughSubject<Crimes, Never>()
    
    internal let mainViewService: MainViewManagerProtocol
    internal var loadingState: LoadingStateProtocol
    
    init(mainViewService: MainViewManagerProtocol = MainViewManager(),
         loading: LoadingStateProtocol = LoadingState()) {
        self.mainViewService = mainViewService
        self.loadingState = loading
    }
    
    func fetchCrimes() {
        loadingState.isLoading = true
        
        let responsePublisher = mainViewService.getCimes()
//            .share().subscribe(responseObject)
            .sink(receiveCompletion: { [weak self ] completion  in
                self?.loadingState.isLoading = false
                switch completion {
                case .failure(let error):
//                    print("Failure: \(error.localizedDescription)")
                    self?.isAlertPresented = true
                    self?.messageError = error.localizedDescription
                case .finished:()
//                    print("Success")
                }
            }, receiveValue: { response in
                    self.crimes = response
//                    print(self.crimes.nhits)
            })
        
        cancellables += [
            responsePublisher
        ]
    }
    
}
