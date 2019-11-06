//
//  LoginTextFieldSection.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 05/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct LoginTextFieldSection: View {
    
    @Binding var username: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: SF.person_circle.name)
                    TextFieldCustom(placeholder: Text("username").foregroundColor(Color.gray), text: $username)
                    .autocapitalization(.none)
                }
                Rectangle().modifier(RectangleTemplate())
            }.padding(.bottom, 20)
            VStack {
                HStack {
                    Image(systemName: SF.lock.name)
                    SecureFieldCustom(placeholder: Text("password").foregroundColor(Color.gray), text: $password)
                }
                Rectangle().modifier(RectangleTemplate())
            }.padding(.bottom, 20)
        }.foregroundColor(Color.white)
    }
}
