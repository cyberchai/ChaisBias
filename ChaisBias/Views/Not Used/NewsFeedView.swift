//
//  NewsFeedView.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import SwiftUI

/*
 
 IGNORE THIS FILE -- CONVERTED ARTICLE LIST TO SWIFTUI FOR DOUBLE TAP FEATURE
 
 */

struct NewsFeedView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ArticleViewController {
        return ArticleViewController()
    }
    
    func updateUIViewController(_ uiViewController: ArticleViewController, context: Context) {}
}

#Preview {
    NewsFeedView()
}
