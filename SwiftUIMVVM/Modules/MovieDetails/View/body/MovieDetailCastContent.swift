//
//  MovieDetailCastContent.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailCastContent: View {
    
    @State var cast: Cast
    
    @State var isShow: Bool = false
    
    var body: some View {
        NavigationLink(destination: ActorDetailView(cast: cast,isShow: true) ) {
        ZStack(alignment: .top) {
                VStack {
                    MoviewDetailCastImage(urlString: cast.profile_path)
                    Text(cast.name)
                        .foregroundColor(Color.black)
                        .frame(width: 120)
                        .font(.system(size: 14, weight: .medium, design: .default) )
                    
                }
//                Button(action: {
//                    self.isShow.toggle()
//                    print("PressButton")
//                }) {
//                        self.isShow ?
//                            Image(systemName: SF.circle.name).resizable().frame(width: 50, height: 50) :
//                            Image(systemName: SF.circle_fill.name).resizable().frame(width: 50, height: 50)
//                }
//                    .frame(width: 50, height: 50)
            }
            
        }
    }
}


