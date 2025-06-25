//
//  FavoritesManager.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import Foundation
import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favorites: [Article] = []

    func add(_ article: Article) {
        if !favorites.contains(where: { $0.url == article.url }) {
            favorites.append(article)
        }
    }

    func remove(_ article: Article) {
        favorites.removeAll { $0.url == article.url } // TODO: double check...
    }

    func isFavorited(_ article: Article) -> Bool {
        favorites.contains { $0.url == article.url }
    }
}

