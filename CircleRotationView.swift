//
//  LaunchAnimationView.swift
//  MapTest
//
//  Created by 孫立明 on 2025/1/3.
//

import SwiftUI

struct LaunchAnimationView: View {
    @State private var isAnimating = false
    @State private var showMainView = false

    var body: some View {
        if showMainView {
            MainView()
        } else {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                CircleShape()
                    .trim(from: 0, to: isAnimating ? 1 : 0)
                    .stroke(Color.blue, lineWidth: 4)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .scaleEffect(isAnimating ? 5 : 1)
                    .animation(.easeInOut(duration: 2), value: isAnimating)
                    .onAppear {
                        isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
}

struct CircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
        return path
    }
}

struct CainView: View {
    var body: some View {
        Text("Welcome to Tarot!")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct LaunchAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAnimationView()
    }
}

#Preview {
    LaunchAnimationView()
}
