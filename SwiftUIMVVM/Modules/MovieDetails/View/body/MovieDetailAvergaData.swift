//
//  MovieDetailAvergaData.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailAverageData: View {
    
    @State var movie: Movie
    
    var body: some View {
        HStack {
            VStack {
                VoteAverageView(movie: movie, textColor: .yellow, textWeight: .bold, textSize: 20)
                Text("\(movie.vote_count)")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .medium, design: .default))
            }
            Spacer()
            VStack {
                VoteAverageView(movie: movie, textColor: .yellow, textWeight: .bold, textSize: 20)
                Text("\(movie.vote_count)")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .medium, design: .default))
            }
            Spacer()
            VStack {
                VoteAverageView(movie: movie, textColor: .yellow, textWeight: .bold, textSize: 20)
                Text("\(movie.vote_count)")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .medium, design: .default))
            }
        }
    }
}
