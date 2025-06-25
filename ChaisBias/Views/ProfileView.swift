//
//  ProfileView.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Hi I'm Chaira")
                .font(.title)
                .bold()
                .padding(.top, 20)

            Text("This is my profile view for now.")
                .font(.title3)
                .foregroundColor(.secondary)

            Divider()

            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
                Text("Saved Articles:")
                    .font(.headline)
                Spacer()
                Text("\(favoritesManager.favorites.count)")
                    .font(.headline)
                    .bold()
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(Color.theme.biasGray)
    }
}

#Preview {
    NavigationView {
        ProfileView()
            .environmentObject(FavoritesManager())
    }
}
