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
    
    var body: some View {
        
        TabView {
            
            MainView(mediaType: .top_rated).tabItem { tabbedItem("Top Rate", .star) }.tag(Tabs.topRate)
            MainView(mediaType: .popular).tabItem { tabbedItem("Popular", .flame) }.tag(Tabs.popular)
            MainView(mediaType: .upcoming).tabItem { tabbedItem("Upcoming", .calendar) }.tag(Tabs.upcoming)
            ProfileView().tabItem { tabbedItem("Profile", .person_circle) }.tag(Tabs.profile)
            
        }
        .navigationBarBackButtonHidden(true)
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
