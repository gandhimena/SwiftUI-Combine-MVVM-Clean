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
    var crimeViewModel: CrimeViewMmodel { get }
}

protocol MainViewManagerProtocol {
    var requestService: RequestServiceProtocol { get }
    func getCimes() -> AnyPublisher<Crimes, Error>
}

protocol CrimeViewMmodelProtocol {
    var mainViewService: MainViewManagerProtocol { get }
    func fetchCrimes()
}
