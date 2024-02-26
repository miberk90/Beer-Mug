//
//  ContentView.swift
//  Beer Mug
//
//  Created by michael anthony on 2/25/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @State private var enlarge = false
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow

    var body: some View {
        VStack {
            Button {
                self.openWindow(id: "Mug")
            } label: {
                Text("open Mug")
            }
            
            
            //            RealityView { content in
            //                // Add the initial RealityKit content
            //                //if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
            //                //    content.add(scene)
            //                }
            //            } update: { content in
            //                // Update the RealityKit content when SwiftUI state changes
            //                if let scene = content.entities.first {
            //                    let uniformScale: Float = enlarge ? 1.4 : 1.0
            //                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
            //                }
            //            }
            //            .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
            //                enlarge.toggle()
            //            })
            //
            //            VStack (spacing: 12) {
            //                Toggle("Enlarge RealityView Content", isOn: $enlarge)
            //                    .font(.title)
            //
            //                Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
            //                    .font(.title)
            //            }
            .frame(width: 360)
            .padding(36)
            .glassBackgroundEffect()
            
        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
    
//    #Preview(windowStyle: .volumetric) {
//        ContentView()
    }
