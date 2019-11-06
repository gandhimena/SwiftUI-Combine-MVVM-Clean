//
//  ButtonsTemplates.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct ButtonTemplate: ViewModifier {
    
    @State var background: Color = .blue
    @State var color: Color = .white
    @State var textSize: CGFloat = 16
    @State var textWeight: Font.Weight = .regular
    
    func body(content: Content) -> some View {
        return content
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Capsule().fill(background))
        .foregroundColor(Color.white)
            .font(.system(size: textSize, weight: textWeight, design: .default))
    }
}

struct ButtonImage: ViewModifier {
    
    @State var image: Image = Image(uiImage: .add)
    
    func body(content: Content) -> some View {
        return content
        .imageScale(.medium)
        .cornerRadius(20)
    }
    
}
