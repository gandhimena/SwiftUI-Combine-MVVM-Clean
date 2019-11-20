//
//  Profile_LateralMenu.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 06/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileLateralMenu: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var startViewModel: StartViewModel
    
    var animation: Animation
    
    var body: some View {
//        HStack {
//            Spacer()
            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .foregroundColor(Color.black)
                    .opacity(viewModel.isSettingsShow ? 0.1 : 0.0)
                    .frame(width: viewModel.isSettingsShow ? UIScreen.main.bounds.width : 0)
                    .onTapGesture { self.viewModel.isSettingsShow.toggle() }
                
                HStack{
                    Spacer()
                    Rectangle()
                        .frame(width: 0.5)
                        .foregroundColor(Color.gray)
                    Rectangle()
                        .foregroundColor(Color.white)
                        .padding(.leading, -8)
                        .frame(width: viewModel.isSettingsShow ? 200 : 0)
                }
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Settings")
                                .modifier(TextTemplate(color: .black, size: 20, weight: .bold))
                            Text("Change password")
                                .modifier(TextTemplate(color: .gray, weight: .regular))
                        }
                        .frame(width: 200)
                    }
                    
                    Spacer()
                    HStack {
                        Button(action: {
                            self.startViewModel.isTabBarActive = false
                            self.viewModel.logout()
                        }) {
                            Text("Logout")
                            .modifier(ButtonTemplate())
                            .frame(width: 180)
                        }
                        
                    }
                    .padding(.top, -150)
                    .padding(.leading, 30 )
                }
                .padding(.top, 60)
                .padding([.leading, .trailing], 20)
                .opacity(viewModel.isSettingsShow ? 1.0 : 0.0)
            }
            .padding(.leading, viewModel.isSettingsShow ? 0 : UIScreen.main.bounds.width)
            .frame(width: viewModel.isSettingsShow ? UIScreen.main.bounds.width : 0)
            .animation(animation)
//        }
    }
}
