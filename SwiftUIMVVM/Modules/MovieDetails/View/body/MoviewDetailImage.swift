//
//  MoviewDetailImage.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 28/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

import Foundation

struct MovieDetailImageView: View {
    
    @ObservedObject var imageData: ImageDataLoader
    
    init(urlString: String ) {
        self.imageData = ImageDataLoader(imageURL: urlString, imageSize: .w_300)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: imageData.image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 260)
                .cornerRadius(10)
                .shadow(color: Color.blackSoft, radius: 10, x: 0, y: 8)
//            .frame(minWidth: 140, idealWidth: 160, maxWidth: 180, minHeight: 200, idealHeight: 220,maxHeight: 260)
        }
        
    }
}
