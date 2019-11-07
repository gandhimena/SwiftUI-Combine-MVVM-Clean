//
//  Profile_scrollView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 06/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileScrollView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                    
                // ----------------------> Profile Section
                VStack {
                    Image("userDefualt")
                    Text("Gandhi Mena")
                        .modifier(TextTemplate(color: .gray, size: 25.0, weight: .bold))
                }
                .padding(.bottom, 30)
                
                // ----------------------> List Section
                VStack {
                    HStack {
                        Text("My List")
                        Spacer()
                        Button(action: {
                            //
                        }) {
                            Image(systemName: SF.plus.name)
                        }
                    }
                    Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(Color.gray)
                }
                
                
            }.padding(.top, 100)
                .padding([.leading, .trailing], 30)
        }
    }
}
