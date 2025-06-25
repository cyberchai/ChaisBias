//
//  LaunchView.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        
        // TODO: add custom font später: https://www.youtube.com/watch?app=desktop&v=4PI04Yj3Ngs
        
        Text("Chai's Bias")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.theme.biasBlue)
        
    }
}

#Preview {
    LaunchView()
}
