//
//  MainTabView.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    @State private var selectedTab = 0

    
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color(.white))

            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
    }
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
//            NewsFeedView()
            NewsFeedSwiftUIView()
                .tabItem { Label("Read", systemImage: "book.pages") }
                .tag(0)

            FavoritesView()
                .tabItem { Label("Faves", systemImage: "heart.fill") }
                .tag(1)

            ProfileView()
                .tabItem { Label("Me", systemImage: "person") }
                .tag(2)
        }
        .tint(Color.theme.biasBlue)
        .animation(.easeInOut, value: selectedTab)

    }
    
    
}

#Preview {
    MainTabView()
        .environmentObject(FavoritesManager())
}

//#Preview {
//    MainTabView()
//}
