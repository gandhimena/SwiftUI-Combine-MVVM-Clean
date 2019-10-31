//
//  MovieDetailMainContent.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailMainContent: View {
    
    @State var movie: Movie
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
            .foregroundColor(Color.white)
            .cornerRadius(20)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            .padding(.bottom, 10)
            VStack {
                Text(movie.title)
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundColor(Color.black)
                    .padding(.bottom, -10)
                    .padding(.top, 60)
                MovieDetailDescription(movie: movie)
                    .padding(.bottom, 30)
                MovieDetailAverageData(movie: movie)
                    .padding([.leading, .trailing], 30)
                    .padding(.bottom, 30)
                MovieDetailOverview(movie: movie)
                    .padding(.bottom, 10)
                ScrolViewCast(movie: movie)
            }.padding([.leading, .trailing], 30)
            
        }
    }
}
