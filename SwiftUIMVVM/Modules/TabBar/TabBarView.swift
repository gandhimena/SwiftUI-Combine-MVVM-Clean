//
//  TabBarView.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 22/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI

struct TabbarView: View {
    
    private enum Tabs: Int {
        case topRate, popular, upcoming, profile
    }
    
    @ObservedObject var startViewModel: StartViewModel
    
    var body: some View {
        containedView(isTabBarActive: startViewModel.isTabBarActive)
    }
    
    func containedView(isTabBarActive: Bool) -> AnyView {
        
        switch startViewModel.isTabBarActive {
        case true:
            return AnyView(
                TabView {
                    MainView(mediaType: .top_rated).tabItem { tabbedItem("Top Rate", .star) }.tag(Tabs.topRate)
                    MainView(mediaType: .popular).tabItem { tabbedItem("Popular", .flame) }.tag(Tabs.popular)
                    MainView(mediaType: .upcoming).tabItem { tabbedItem("Upcoming", .calendar) }.tag(Tabs.upcoming)
                    ProfileView(viewModel: .init(), starViewModel: startViewModel).tabItem { tabbedItem("Profile", .person_circle) }.tag(Tabs.profile)
                }.navigationBarBackButtonHidden(true)
            )
        case false:
            return AnyView(
                TabView {
                    Text("a").tabItem { tabbedItem("None", ._00_circle)}.tag(Tabs.popular)
                }.navigationBarBackButtonHidden(true)
            )
        }
    }
}

extension TabbarView {
    private func tabbedItem(_ text: String, _ image: SF) -> some View {
        return VStack {
            Image(systemName: image.name).imageScale(.medium)
            Text(text)
        }
    }
}
