//
//  MainViewContainer.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct MainViewContainer: View {
    
    @ObservedObject var viewModel: CrimeViewMmodel
    
    var body: some View {
        ScrollView() {
            SquareView(number: $viewModel.crimes.nhits)
            Spacer()
            Button(action: {
                self.viewModel.fetchCrimes()
            }) {
                Text("Fetch info")
            }
            .modifier(ButtonTemplate(background: .blue))
        }
        .navigationBarTitle("Crimes population")
        
    }
}
