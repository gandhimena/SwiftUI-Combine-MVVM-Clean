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
    
    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var starViewModel: StartViewModel
    
    var animation: Animation {
        Animation.spring()
            .speed(1.0)
            .delay(0.1)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ProfileScrollView(viewModel: viewModel)
                ProfileLateralMenu(viewModel: viewModel, startViewModel: starViewModel, animation: animation)
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Profile")
            .navigationBarItems(trailing:
                NavBarItemIcon(action: { self.viewModel.isSettingsShow.toggle() }, image: .ellipsis, color: .gray)
            )
        }.alert(isPresented: self.$viewModel.isAlertPresented) {
            Alert(title: Text("User Auth"),
              message: Text("You need authorize the app to create list"),
              primaryButton: Alert.Button.cancel(Text("Cancel")),
              secondaryButton: Alert.Button.default(Text("Go to Authorize"), action: {
                self.viewModel.authorizeToken()
              })
            )
        }
    }
}
