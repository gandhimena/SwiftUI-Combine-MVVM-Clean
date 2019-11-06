//
//  ActorImageView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ActorImageView: View {
    
    @ObservedObject var imageData: ImageDataLoader
    var isShow: Bool = false
    
    var animation: Animation {
        Animation.spring()
            .speed(1.0)
            .delay(0.1)
    }
    
    init(urlString: String?, imageSize: ImageMovieWidthSize, isShow: Bool) {
        self.isShow = isShow
        self.imageData = ImageDataLoader(imageURL: urlString, imageSize: imageSize)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color.black)
                .frame(width: isShow ? UIScreen.main.bounds.width : 0, height: isShow ? UIScreen.main.bounds.height : 0)
                .opacity(isShow ? 1.0 : 0.0)
                .animation(animation)
            Image(uiImage: imageData.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: isShow ? UIScreen.main.bounds.width : 0)
                .overlay(
                    Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                    )
                    .clipped()
            ).animation(animation)
                
        }
    }
}
