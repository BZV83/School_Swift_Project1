//
//  AnimationViewModifier.swift
//  Project1
//
//  Created by Brendan Vick on 10/25/24.
//

import SwiftUI


//ChatGPT
extension View {
    func onAnimationCompleted<Value: Equatable>(for value: Value, perform action: @escaping () -> Void) -> some View {
        self.modifier(AnimationCompletionModifier(value: value, action: action))
    }
}

struct AnimationCompletionModifier<Value: Equatable>: AnimatableModifier {
    var value: Value
    var action: () -> Void
    
    var animatableData: Value {
        get { value }
        set { if newValue != value { action() } }
    }
    
    func body(content: Content) -> some View {
        content
    }
}
