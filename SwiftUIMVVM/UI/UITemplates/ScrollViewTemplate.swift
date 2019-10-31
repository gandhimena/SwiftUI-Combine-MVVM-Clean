//
//  ScrollViewTemplate.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 24/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ScrollViewTemplate: View {
    
    @Binding var number: Int
    
    var body: some View {
        ScrollView() {
            Button(action: {
//                self.viewModel.fetMovies()
            }) {
                Text("Fetch info")
            }
            .modifier(ButtonTemplate(background: .blue))
        }
        .navigationBarTitle("Video Popular")
    }
}
