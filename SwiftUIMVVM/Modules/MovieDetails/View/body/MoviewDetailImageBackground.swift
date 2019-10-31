//
//  MoviewDetailImageBackground.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 28/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MovieDetailImageBackground: View {
    
    @ObservedObject var imageData: ImageDataLoader
    
    init(urlString: String ) {
        self.imageData = ImageDataLoader(imageURL: urlString, imageSize: .w_500)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: imageData.image)
                .resizable()
                .aspectRatio(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), contentMode: .fill)
                .blur(radius: 10)
        }
        
    }
}
