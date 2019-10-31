//
//  MoviewDetailCastImage.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 29/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MoviewDetailCastImage: View {
    
    @ObservedObject var imageData: ImageDataLoader
    
    init(urlString: String? ) {
        self.imageData = ImageDataLoader(imageURL: urlString, imageSize: .w_200)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: imageData.image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
            .cornerRadius(40)
        }
    }
}
