//
//  ButtonsTemplates.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct ButtonTemplate: ViewModifier {
    
    @State var background: Color = .red
    
    func body(content: Content) -> some View {
        return content
        .frame(width: 200, height: 46, alignment: .center)
        .background(background)
        .foregroundColor(.white)
        .cornerRadius(10)
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
