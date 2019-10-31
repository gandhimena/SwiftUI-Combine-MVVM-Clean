//
//  MovieDetailDescription.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailDescription: View {
    
    @State var movie: Movie
    
    var body: some View {
        VStack {
            HStack {
                Text(movie.release_date.prefix(4))
                    .foregroundColor(Color.gray)
                    .font(.system(size: 14, weight: .medium, design: .default))
                Circle()
                    .foregroundColor(Color.gray)
                    .frame(width: 5, height: 5)
                Text(movie.adult ? "adult" : "family")
                    .font(.system(size: 14, weight: .medium, design: .default))
                    .foregroundColor(Color.gray)
            }
            Text("comedy / action / love")
            .foregroundColor(Color.gray)
        }
        
    }
}
