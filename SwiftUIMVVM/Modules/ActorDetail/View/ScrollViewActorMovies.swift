//
//  ScrollViewActorMovies.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 30/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ScrollViewActorMovies: View {
    
    @ObservedObject var actorDetailViewModel: ActorDetailViewModel
    
    var cast: Cast
    
    init(cast: Cast) {
        self.cast = cast
        self.actorDetailViewModel = ActorDetailViewModel(castID: cast.credit_id)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Known for: ")
            .foregroundColor(Color.white)
            .modifier(TextTemplate(weight: .bold) )
            .padding(.bottom, 15)
                
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(actorDetailViewModel.castData.known_for) { castMovie in
                        ActorMovieItem(cast: castMovie)
                    }
                }
            }.padding(.bottom, 20)
        }.padding([.leading, .trailing], 30)
    }
}
