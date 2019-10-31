//
//  MovieDetailViewOverview.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailOverview: View {
    
    @State var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("OverView")
                .modifier(TextTemplate(color: .yellow, size: 25, weight: .bold) )
            Text(movie.overview)
                .modifier( TextTemplate(color: .gray))
        }
        
    }
}
