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
    
    @State internal var action: () -> Void
    @State internal var isActive: Bool
    
    var body: some View {
        
        NavigationLink(destination: TabbarView()) {
            Text("Enter")
            .modifier(ButtonTemplate())
        }
        
//        Button(action: {
//            self.isActive = true
//        }) {
//            Text("Enter")
//            .modifier(ButtonTemplate())
//        }
//        .sheet(isPresented: $isActive) {
//            TabbarView()
//        }
    }
}
