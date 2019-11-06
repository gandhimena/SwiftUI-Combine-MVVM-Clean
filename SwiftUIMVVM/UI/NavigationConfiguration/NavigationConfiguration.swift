//
//  NavigationConfiguration.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 05/11/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import Foundation
import SwiftUI
struct NavigationConfiguration: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfiguration>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfiguration>) {
        if let vc = uiViewController.navigationController {
            self.configure(vc)
        }
    }
}
