//
//  NewsAPIService.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import Foundation

struct Article: Decodable {
    let title: String
    let description: String? // optional description
    let url: String
}

struct NewsResponse: Decodable { // ....
    let articles: [Article]
}

class NewsAPIService {
    static let shared = NewsAPIService()
    private let apiKey = "b9b0bd2df1c044548481fba33cf93481"
    
    func fetchArticles(completion: @escaping ([Article]) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Error: ", error?.localizedDescription ?? "")
                return
            }
            do {
                let result = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(result.articles)
            } catch {
                print("Decoding error:", error)
            }
        }.resume()
    }
    
}
