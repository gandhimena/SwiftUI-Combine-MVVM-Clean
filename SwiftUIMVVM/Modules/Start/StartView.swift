//
//  StartView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 19/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

class StartViewModel: ObservableObject {
    
    @Published var isTabBarActive: Bool = false
}

struct StartView: View {
    
    @ObservedObject var viewModel: StartViewModel
    
    var body: some View {
        ZStack {
            TabbarView(startViewModel: viewModel)
                .opacity(viewModel.isTabBarActive ? 1.0 : 0.0)
            LoginView(loginViewModel: .init(), startViewModel: viewModel)
                .opacity(viewModel.isTabBarActive ? 0.0 : 1.0)
        }
    }
}
