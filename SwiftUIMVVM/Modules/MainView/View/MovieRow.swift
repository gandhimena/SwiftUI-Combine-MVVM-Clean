//
//  CoursesRow.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 20/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    @State var movie: Movie
    
    var body: some View {
        
        NavigationLink(destination: MovieDetailsView(movie: movie, isShow: true) ) {
             ZStack(alignment: .bottom) {
                MainViewImageItem(urlString: movie.backdrop_path)
                InfoBarView(movie: movie)
            }
           
        }
    }
}

