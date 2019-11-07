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
    
    @Binding var toggle: Bool
    var animation: Animation
    
    var body: some View {
        HStack {
            Spacer()
            ZStack(alignment: .topLeading) {
                HStack{
                    Rectangle()
                        .frame(width: 0.5)
                        .foregroundColor(Color.gray)
                    Rectangle()
                    .foregroundColor(Color.white)
                        .padding(.leading, -8)
                }
        
                VStack(alignment: .leading, spacing: 20) {
                    Text("Settings")
                        .modifier(TextTemplate(color: .black, size: 20, weight: .bold))
                    Text("Change password")
                        .modifier(TextTemplate(color: .gray, weight: .regular))
                    Spacer()
                    HStack {
                        Text("Logout")
                        .modifier(ButtonTemplate())
                    }
                    .padding(.top, -150)
                }
                .padding(.top, 60)
                .padding([.leading, .trailing], 20)
                .opacity(toggle ? 1.0 : 0.0)
            }
            .padding(.leading, toggle ? 0 : 210)
            .frame(width: toggle ? 200 : 0)
            .animation(animation)
        }
    }
}
