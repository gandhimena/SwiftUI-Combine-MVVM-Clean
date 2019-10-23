//
//  Constants.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}

enum ViewState {
    case idle
    case loading
    case finishedLoading
    case success
    case error
}
