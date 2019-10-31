//
//  Media.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 23/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation

struct Media {
    var mediaType: MediaType
    var categoryID: MediaCategories
    var mediaRatingType: MediaRatingType
    var language: BaseLangue
    var page: Int
    
    init(mediaType: MediaType = .movie,
         categoryID: MediaCategories = .drama,
         mediaRatingType: MediaRatingType = .popular,
         language: BaseLangue = .en,
         page: Int) {
        self.mediaType = mediaType
        self.categoryID = categoryID
        self.mediaRatingType = mediaRatingType
        self.language = language
        self.page = page
    }
}
