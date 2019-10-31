//
//  TextTemplate.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 28/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct TextTemplate: ViewModifier {
    
    @State var color: Color = .black
    @State var size: CGFloat = 16
    @State var weight: Font.Weight = .regular
    
    func body(content: Content) -> some View {
        return content
        .foregroundColor(color)
        .font(.system(size: size, weight: weight, design: .default))
    }
}
