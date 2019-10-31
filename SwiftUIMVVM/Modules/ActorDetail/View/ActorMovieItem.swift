//
//  ActorMovieItem.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 30/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ActorMovieItem: View {
    
    var cast: CastMovie
    
    var body: some View {
        VStack {
            ActorMovieItemImage(urlString: cast.poster_path)
            Text(cast.title)
                .foregroundColor(Color.white)
                .frame(width: 120)
                .font(.system(size: 14, weight: .medium, design: .default) )
        }
        
    }
}
