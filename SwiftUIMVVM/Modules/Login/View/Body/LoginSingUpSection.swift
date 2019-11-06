//
//  LoginSingUpSection.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 05/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct LoginSignUpSection: View {
    
    var body: some View {
        HStack {
            Text("Don't have an account?")
                .opacity(0.5)
                .foregroundColor(Color.white)
            Button(action: {
                let url = URL(string: "https://www.themoviedb.org/account/signup")
                UIApplication.shared.open(url!)
            })
            {
               Text("SING UP")
            }
            .foregroundColor(Color.white)
        }
    }
}
