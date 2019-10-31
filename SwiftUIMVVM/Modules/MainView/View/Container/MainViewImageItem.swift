//
//  MainViewImageItem.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MainViewImageItem: View {
    
    @ObservedObject var imageData: ImageDataLoader
    
    init(urlString: String? ) {
        self.imageData = ImageDataLoader(imageURL: urlString, imageSize: .w_400)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: imageData.image)
                .resizable()
                .renderingMode(.original)
            .overlay(
                Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                )
                .clipped()
            )
            .frame(height: 200)
            .cornerRadius(5)
            .shadow(radius: 10)
        }
    }
}
