//
//  voteAverageView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 28/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI



struct VoteAverageView: View {
  
    @State var movie: Movie
    @State var textColor: Color = .white
    @State var textWeight: Font.Weight = .regular
    @State var textSize: CGFloat = 16
    
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: SF.star_fill.name)
                .resizable()
                .imageScale(.small)
                .foregroundColor(Color.yellow)
                .frame(minWidth: 10, maxWidth: 15, minHeight: 10, maxHeight: 15)
            Text(movie.vote_average.shortDecimal)
                .modifier(TextTemplate(color: textColor, size: textSize, weight: textWeight))
                
        }
    }
    
}
