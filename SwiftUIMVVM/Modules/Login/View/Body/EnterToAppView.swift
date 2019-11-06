//
//  EnterToAppView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 05/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct EnterToAppView: View {
    
    @State var action: () -> Void
    @State var isActive: Bool
    
    var body: some View {
        
        Button(action: {
            self.isActive = true
        }) {
            Text("Enter")
            .modifier(ButtonTemplate())
        }
        .sheet(isPresented: $isActive) {
            TabbarView()
        }
    }
}
