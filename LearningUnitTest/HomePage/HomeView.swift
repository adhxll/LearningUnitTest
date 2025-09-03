//
//  HomeView.swift
//  LearningUnitTest
//
//  Created by Adhella Subalie on 02/09/25.
//

import SwiftUI

enum CakePadding: CGFloat {
    case bouncing = 2.0
    case stable = 10.0
}

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = .init()
    @State private var cakePadding: CakePadding = .stable
    @State private var opacity: Double = 1.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Shortcake Tapper")
                .font(.title)
                .fontWeight(.bold)
            Text("Tap count: \(viewModel.tapCount)")
                .fontWeight(.bold)
            ZStack {
                Text("Buy me strawberry shortcake pls!")
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .frame(maxWidth: 120)
                Image("strawberry-shortcake")
                    .resizable()
                    .scaledToFit()
                    .opacity($opacity.wrappedValue)
                    .padding($cakePadding.wrappedValue.rawValue)
                    .onTapGesture {
                        viewModel.onCakeTapped()
                        withAnimation(.bouncy(duration: 0.1)) {
                            cakePadding = .bouncing
                        }
                        completion: {
                            withAnimation(.easeOut(duration: 0.2)) {
                                cakePadding = .stable
                            }
                        }
                    }
                    .onChange(of: viewModel.shouldTriggerCakeDissapear) { oldValue, newValue in
                        if oldValue == false && newValue == true {
                            withAnimation(.easeOut(duration: 2.0)) {
                                opacity = 0.0
                            }
                            completion: {
                                viewModel.onCakeAppearAgain()
                                opacity = 1.0
                            }
                        }
                    }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
