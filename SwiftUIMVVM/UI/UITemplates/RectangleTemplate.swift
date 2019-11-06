//
//  RectangleTemplate.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 05/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct RectangleTemplate: ViewModifier {

    @State var foregroundColor: Color = Color.white
    @State var height: CGFloat = 1.0
    @State var opacity: Double = 0.7
    
    func body(content: Content) -> some View {
        return content
            .frame(height: height)
            .foregroundColor(foregroundColor)
            .opacity(opacity)
    }
}
