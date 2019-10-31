//
//  movieInfoBarView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 28/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct InfoBarView: View {
    
    @State var movie: Movie
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(movie.title)
            .foregroundColor(Color.white)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: .infinity, alignment: .bottomLeading)
            .padding([.bottom,.leading], 10)
            VStack(alignment: .trailing) {
                VoteAverageView(movie: movie)
                Text(String(movie.release_date.prefix(4)) )
                    .foregroundColor(Color.white)
            }.padding([.bottom, .trailing], 10)
                        
        }
    }
}
