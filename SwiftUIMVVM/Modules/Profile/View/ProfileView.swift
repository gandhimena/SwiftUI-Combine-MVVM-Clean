//
//  ProfileView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 06/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @State var isSettingsShow: Bool = false
    
    var animation: Animation {
        Animation.spring()
            .speed(1.0)
            .delay(0.1)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ProfileScrollView()
                ProfileLateralMenu(toggle: $isSettingsShow, animation: animation)
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Profile")
            .navigationBarItems(trailing:
                NavBarItemIcon(action: { self.isSettingsShow.toggle() }, image: .ellipsis)
            )
        }
    }
}
