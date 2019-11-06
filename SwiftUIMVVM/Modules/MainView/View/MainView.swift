//
//  ContentView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 19/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI



struct MainView: View, ContentViewProtocol {
    
    @ObservedObject var movieViewModel: PopularMovieViewMmodel
    
    var mediaType: MediaRatingType
    
    @State var isPresent: Bool = true
    
    init(mediaType: MediaRatingType = .popular) {
        self.mediaType = mediaType
        movieViewModel = PopularMovieViewMmodel(ratingType: mediaType)
    }
    
    var body: some View {
        ActivityIndicatorView(loadingState: movieViewModel.loadingState as! LoadingState) {
            NavigationView {
                List(self.movieViewModel.movies) { movie in
                    MovieRow(movie: movie)
                    .onAppear {
                        self.movieViewModel.listItemAppears(movie)
                    }
                }
                .alert(isPresented: self.$movieViewModel.isAlertPresented) {
                    Alert(title: Text("Error"), message: Text(self.movieViewModel.messageError), dismissButton: .default(Text("Ok")))
                }.navigationBarTitle(self.mediaType.rawValue.replacingOccurrences(of: "_", with: " "))
//                .navigationBarItems(leading:
//                    NavBarItemIcon(action: {}, image: .line_horizontal_3)
//                )
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(movieViewModel: .init())
//    }
//}
