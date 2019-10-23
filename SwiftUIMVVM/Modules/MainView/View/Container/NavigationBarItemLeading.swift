//
//  NavigationBarItemLeading.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct NavigationBarItemLeadig: View {
    
    @ObservedObject var crimeViewModel: CrimeViewMmodel
    
    var body: some View {
        Button(action: {
            self.crimeViewModel.fetchCrimes()
        }) { Text("Fetch info") }
    }
}

struct NavigationBarItemTrailing: View {
    
    @ObservedObject var crimeViewModel: CrimeViewMmodel
    
    var body: some View {
        Button(action: {
            self.crimeViewModel.fetchCrimes()
        }) {
            Image(systemName: SF.house.name)
                .renderingMode(Image.TemplateRenderingMode.original)
        }
    }
}
