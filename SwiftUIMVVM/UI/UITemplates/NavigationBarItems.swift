//
//  NavigationBarItemLeading.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct NavBarItemIcon: View {
    var action: () -> Void
    var image: SF
    
    var body: some View {
        Button(action: action) {
            Image(systemName:image.name)
                .renderingMode(Image.TemplateRenderingMode.template)
                .foregroundColor(Color.primary)
        }
    }
}

struct NavBarItemText: View {
    var action: () -> Void
    var text: String
    
    var body: some View {
        Button(action: action) {
            Text(text)
            .foregroundColor(Color.myOrangeColor)
        }
    }
}
