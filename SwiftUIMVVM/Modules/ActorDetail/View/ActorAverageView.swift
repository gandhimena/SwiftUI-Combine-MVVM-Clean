//
//  ActorAverageView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 30/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ActorAverageView: View {
    
    @ObservedObject var actorDetailViewModel: ActorDetailViewModel
    
    init(castID: String) {
        self.actorDetailViewModel = ActorDetailViewModel(castID: castID)
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: SF.star_fill.name)
                .resizable()
                .imageScale(.small)
                .foregroundColor(Color.yellow)
                .frame(minWidth: 10, maxWidth: 15, minHeight: 10, maxHeight: 15)
            Text(actorDetailViewModel.castData.popularity.shortDecimal)
                .modifier(TextTemplate(color: Color.white, size: 18, weight: .bold))
                       
        }
    }
}
