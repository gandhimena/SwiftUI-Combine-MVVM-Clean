//
//  ScrollViewCast.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ScrolViewCast: View {
    
    @ObservedObject var movieDetailViewModel: MovieDetailViewModel
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        self.movieDetailViewModel = MovieDetailViewModel(movieID: movie.id)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Cast")
                .modifier(TextTemplate(weight: .bold) )
                Spacer()
                Button(action: {
                    //
                }) {
                    HStack{
                        Text("See all")
                        Image(systemName: SF.chevron_right.name)
                    }.foregroundColor(Color.yellow)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movieDetailViewModel.cast) { cast in
                        MovieDetailCastContent(cast: cast)
                    }
                }
            }.padding(.bottom, 80)
            
            
            
            
        }
    }
}
