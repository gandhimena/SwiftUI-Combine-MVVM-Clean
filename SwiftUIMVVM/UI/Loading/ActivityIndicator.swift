//
//  ActivityIndicator.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 21/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    typealias UIViewType = UIActivityIndicatorView
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    static func dismantleUIView(_ uiView: UIActivityIndicatorView, coordinator: ()) {
    }
}

struct ActivityIndicatorView<Content>: View where Content: View {
    @ObservedObject var loadingState: LoadingState
    var contex: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.contex()
                    .disabled(self.loadingState.isLoading)
                    .blur(radius: self.loadingState.isLoading ? 3: 0)
                VStack {
                    Text("Loading.....")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: 250, height: 250)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.loadingState.isLoading ? 1 : 0)
            }
        }
    }
}

protocol LoadingStateProtocol {
    var isLoading: Bool { get set }
}

class LoadingState: ObservableObject, LoadingStateProtocol {
    @Published var isLoading: Bool = false
}
