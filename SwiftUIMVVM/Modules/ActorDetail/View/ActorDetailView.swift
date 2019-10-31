//
//  ActorDetailView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 30/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ActorDetailView: View {
    
    @State var cast: Cast
    @State var isShow: Bool
    
    var animation: Animation {
        Animation.spring()
            .speed(1.0)
            .delay(0.1)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            ActorImageView(urlString: cast.profile_path, imageSize: .w_500, isShow: isShow)
            ScrollView {
                VStack {
                    Text(cast.name)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                        .padding(.bottom, -10)
                    ActorAverageView(castID: cast.credit_id)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom, 30)
                }.padding(.top, 420)
                ScrollViewActorMovies(cast: cast)
//                .padding(.top, 560)
            }
                .padding(.bottom, 30)
                .frame(width: isShow ? UIScreen.main.bounds.width : 0, height: isShow ? UIScreen.main.bounds.height : 0)
                .animation(animation)
//            Button(action: {
//                self.isShow.toggle()
//            }) {
//                self.isShow ?
//                    Image(systemName: SF.circle.name).resizable().frame(width: 50, height: 50) :
//                    Image(systemName: SF.circle_fill.name).resizable().frame(width: 50, height: 50)
//            }
//                .frame(width: 50, height: 50)
//                .padding(.top, 200)
        }
    }
}
