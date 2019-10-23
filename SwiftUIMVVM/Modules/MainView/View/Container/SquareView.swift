//
//  SquareView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct SquareView: View {
        
    @Binding var number: Int
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Mexico Ctiy")
                .foregroundColor(.white)
            Text("\(number)")
            .font(.system(size: 60))
                .foregroundColor(.white)
            }
        .frame(width: 300, height: 300)
        .background(Color.green)
        .cornerRadius(20)
    }
}
