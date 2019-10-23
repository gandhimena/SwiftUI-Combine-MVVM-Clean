//
//  SearchParameters.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct SearchParameters: Decodable {
    var refine: Categories
    
    init(refine: Categories = Categories() ) {
        self.refine = refine
    }
}
