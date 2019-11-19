//
//  LoginTextFieldsAndSignUpSection.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 05/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct LoginTextfieldsAndSignUpSection: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            LoginTextFieldSection(username: $loginViewModel.username, password: $loginViewModel.password)
            //-------------------> Login
            Button(action: {
                self.loginViewModel.createRequestToken()
            })
            {
               Text("LOGIN")
            }.modifier(ButtonTemplate())
                .padding([.bottom], 10)
            
            HStack {
                Spacer()
                Button(action: {
                    let url = URL(string: "https://www.themoviedb.org/account/reset-password")
                    UIApplication.shared.open(url!)
                }) {
                    Text("Forgot Password?")
                        .opacity(0.5)
                }.foregroundColor(Color.white)
            }.padding([.bottom], 50)
            LoginSignUpSection()
            .padding()
        }
    }
}
