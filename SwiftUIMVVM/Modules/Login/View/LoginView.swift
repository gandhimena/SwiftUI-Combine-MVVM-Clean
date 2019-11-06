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
    
    var animation: Animation {
        Animation.spring()
            .speed(1.0)
            .delay(0.1)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LoginImageBackground()
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
                        EnterToAppView(action: loginViewModel.createSession, isActive: loginViewModel.isLoginSuccess)
                        .padding(.top, 100)
                        .opacity(loginViewModel.isLoginSuccess ? 1.0 : 0.0)
                        .padding(.bottom, loginViewModel.isLoginSuccess ? 0.0 : -50 )
                        .animation(animation)
                    }.padding([.leading, .trailing], 30)
                }.onTapGesture {
                    self.endEditing()
                }
                
            }.onAppear {
                self.loginViewModel.createRequestToken()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

