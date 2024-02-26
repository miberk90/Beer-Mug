//
//  Mug.swift
//  Beer Mug
//
//  Created by michael anthony on 2/25/24.
//

import SwiftUI
import RealityKit

struct Mug: View {
    var body: some View {
        Model3D(named: "Mug_of_Beer") { modelPhase in
            switch modelPhase {
            case .empty:
                ProgressView()
                    .controlSize(.regular)
            case .success(let resolvedModel3D):
                resolvedModel3D
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure(let error):
                Text("Where's your mug brother?")
            }
                
            
            }
            
        }
    }

#Preview {
    Mug()
}
