//
//  Pie.swift
//  Project1
//
//  Created by Brendan Vick on 10/25/24.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    let clockwise = true
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians , endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius: Double = min(rect.height, rect.width) / 2
        let startPoint = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        var path = Path()
        
        path.move(to: center)
        path.addLine(to: startPoint)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        
        return path
    }
}


#Preview {
    Pie(startAngle: Angle(degrees: 360-90), endAngle: Angle(degrees: 105-90))
        .foregroundStyle(.red)
        .opacity(0.4)
        .padding()
}
