//
//  ImmersiveView.swift
//  Beer Mug
//
//  Created by michael anthony on 2/25/24.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
//            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
 //               content.add(scene)
            }
        }
    }

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
