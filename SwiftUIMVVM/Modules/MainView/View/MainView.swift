//
//  ContentView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 19/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct MainView: View, ContentViewProtocol {
    
    @ObservedObject var crimeViewModel: CrimeViewMmodel
    
    var body: some View {
        ActivityIndicatorView(loadingState: crimeViewModel.loadingState as! LoadingState) {
            NavigationView {
                MainViewContainer(viewModel: self.crimeViewModel)
                .navigationBarItems(
                    leading:NavigationBarItemLeadig(crimeViewModel: self.crimeViewModel),
                    trailing: NavigationBarItemTrailing(crimeViewModel: self.crimeViewModel)
                )
                .alert(isPresented: self.$crimeViewModel.isAlertPresented) {
                    Alert(title: Text("Error"), message: Text(self.crimeViewModel.messageError), dismissButton: .default(Text("Ok")))
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(crimeViewModel: .init())
    }
}
