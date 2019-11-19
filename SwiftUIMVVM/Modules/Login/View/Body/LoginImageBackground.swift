//
//  LoginImageBackground.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 05/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct LoginImageBackground: View {
    var body: some View {
        GeometryReader { geo in
            Image("login_background")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height)
                .shadow(color: Color.black, radius: 10, x: 0, y: 8)
            .overlay(
            Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
            )
            .clipped()
            )
        }   
    }
}
