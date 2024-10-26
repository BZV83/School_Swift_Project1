//
//  ShakeEffectAnimation.swift
//  Project1
//
//  Created by Brendan Vick on 10/26/24.
//

import SwiftUI

struct ShakeEffect: AnimatableModifier {
    var shakes: Int

    var animatableData: CGFloat {
        get { CGFloat(shakes) }
        set { shakes = Int(newValue) }
    }

    func body(content: Content) -> some View {
        content
            .offset(x: shakes % 2 == 0 ? -5 : 5) // Alternate between left and right
            .animation(.easeInOut(duration: 0.1), value: shakes) // Animate the offset
    }
}
