//
//  FavoritesView.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    @State private var selectedArticle: Article?
    @State private var showDeleteAlert = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    if favoritesManager.favorites.isEmpty {
                        Text("No saved articles yet.")
                            .foregroundColor(.gray)
                            .padding(.top, 60)
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        ForEach(favoritesManager.favorites, id: \.url) { article in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(article.title)
                                    .font(.headline)

                                Text(article.description ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(.white))
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                            .onLongPressGesture {
                                selectedArticle = article
                                showDeleteAlert = true
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .background(Color.theme.biasGray)
            .navigationTitle("Favourite Articles")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Remove from Favorites?", isPresented: $showDeleteAlert) {
                Button("Remove", role: .destructive) {
                    if let article = selectedArticle {
                        favoritesManager.remove(article)
                        selectedArticle = nil
                    }
                }
                Button("Cancel", role: .cancel) {
                    selectedArticle = nil
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesManager())
}
