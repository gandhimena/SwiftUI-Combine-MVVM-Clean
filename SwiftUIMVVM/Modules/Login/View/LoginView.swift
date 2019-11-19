//
//  LoginView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 31/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI



struct LoginView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    @ObservedObject var startViewModel: StartViewModel
    
    var animation: Animation {
        Animation.spring()
            .speed(1.0)
            .delay(0.1)
    }
    
    var body: some View {
        
//        NavigationView {
            ZStack {
                LoginImageBackground()
                    .opacity(startViewModel.isTabBarActive ? 0.0 : 1.0)
                ScrollView(.vertical) {
                    ZStack {
                        VStack {
                            // -------------------------------> SECTION: header
                            Image("SwiftUI_Icon")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 200)
                            // -------------------------------> SECTION: body
                            LoginTextfieldsAndSignUpSection(loginViewModel: loginViewModel)
                            .opacity(loginViewModel.isLoginSuccess ? 0.0 : 1.0)
                            .padding(.top, loginViewModel.isLoginSuccess ? -50 : 0)
                            .animation(animation)
                        }
                        .padding(.top, 50)
                        // -------------------------------> SECTION: Enter to app
//                        EnterToAppView(action: loginViewModel.createSession, isActive: loginViewModel.isLoginSuccess)
                        EnterToAppView(viewModel: startViewModel)
                        .padding(.top, 100)
                        .opacity(loginViewModel.isLoginSuccess ? 1.0 : 0.0)
                        .padding(.bottom, loginViewModel.isLoginSuccess ? 0.0 : -50 )
                        .animation(animation)
                    }.padding([.leading, .trailing], 30)
                        
                }.onTapGesture {
                    self.endEditing()
                }
                .opacity(startViewModel.isTabBarActive ? 0.0 : 1.0)
            }
            .edgesIgnoringSafeArea(loginViewModel.isLoginSuccess ? .init() : .all)
            .alert(isPresented: self.$loginViewModel.isAlertPresented) {
                Alert(title: Text("Error"), message: Text(self.loginViewModel.errorMessage), dismissButton: .default(Text("OK")))
            }
//        }
    }
}

