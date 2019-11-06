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
        case home, likes, love, notif, profile
    }
    
    var body: some View {
        TabView {
            MainView(mediaType: .top_rated).tabItem { tabbedItem("top Rate", .star) }.tag(Tabs.likes)
            MainView(mediaType: .popular).tabItem { tabbedItem("Popular", .flame) }.tag(Tabs.home)
            MainView(mediaType: .upcoming).tabItem { tabbedItem("upcoming", .calendar) }.tag(Tabs.love)
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
