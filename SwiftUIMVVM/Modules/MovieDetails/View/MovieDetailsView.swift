//
//  MovieDetails.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 28/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailsView: View {
    
    @State var movie: Movie
    @State var isShow: Bool
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var animation: Animation {
        Animation.spring()
            .speed(1.0)
            .delay(0.1)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            MovieDetailImageBackground(urlString: movie.poster_path)
                .animation(animation)
            ScrollView {
                ZStack(alignment: .top) {
                    MovieDetailMainContent(movie: movie)
                        .padding(.top, 300)
                        .animation(animation)
                    MovieDetailImageView(urlString: movie.poster_path)
                        .padding(.top, 80)
                        .animation(animation)
                }
            }
        }
    }
}
