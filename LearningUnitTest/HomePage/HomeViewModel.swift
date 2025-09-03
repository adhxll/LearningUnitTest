//
//  HomeViewModel.swift
//  LearningUnitTest
//
//  Created by Adhella Subalie on 02/09/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var shouldTriggerCakeDissapear: Bool = false
    @Published var tapCount: Int = 0
    
    func onCakeTapped() {
        tapCount += 1
        if tapCount >= 5 {
            shouldTriggerCakeDissapear = true
        }
    }
    
    func onCakeAppearAgain() {
        tapCount = 0
        shouldTriggerCakeDissapear = false
    }
}
