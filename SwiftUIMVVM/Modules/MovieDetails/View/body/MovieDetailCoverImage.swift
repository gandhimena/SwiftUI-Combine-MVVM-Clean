//
//  MovieDetailCoverImage.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 30/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailCoverImage: View {
    
    @State var movie: Movie

    var body: some View {
        VStack {
            MovieDetailImageView(urlString: movie.poster_path)
            Text(movie.title)
                .font(.system(size: 28, weight: .bold, design: .default))
                .foregroundColor(Color.black)
                .padding(.bottom, -10)
            MovieDetailDescription(movie: movie)
                .padding(.bottom, 30)
            
        }
    }
}
