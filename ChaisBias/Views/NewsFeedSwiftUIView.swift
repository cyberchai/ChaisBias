//
//  NewsFeedSwiftUIView.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import SwiftUI

struct NewsFeedSwiftUIView: View {
    
    @EnvironmentObject var favoritesManager: FavoritesManager

    
    @State private var articles: [Article] = []
    
    @State private var showHeart: Bool = false
//    @State private var heartPosition: CGPoint = .zero
    @State private var heartedArticleURL: String? = nil



    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.biasGray
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(articles, id: \.url) { article in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(article.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)

                                Text(article.description ?? " ")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                            .overlay(
                                GeometryReader { geo in
                                    ZStack { // animation
                                        if heartedArticleURL == article.url {
                                            Image(systemName: "heart.fill")
                                                .font(.system(size: 40))
                                                .foregroundColor(Color.theme.biasBlue)
                                                .opacity(1)
                                                .scaleEffect(1.2)
                                                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                                                .transition(.opacity.combined(with: .scale))
                                        }
                                    }
                                }
                            )
                            .onTapGesture(count: 2) {
                                addToFavorites(article)
                                heartedArticleURL = article.url
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        heartedArticleURL = nil
                                    }
                                }
                            }

                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("News Glance!")
//            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            NewsAPIService.shared.fetchArticles { fetched in
                DispatchQueue.main.async {
                    self.articles = fetched
                }
            }
        }
    }


    func addToFavorites(_ article: Article) {
        favoritesManager.add(article)
    }

}

//#Preview {
//    NavigationView {
//        NewsFeedSwiftUIView()
//    }
//}

#Preview {
    NewsFeedSwiftUIView()
}
