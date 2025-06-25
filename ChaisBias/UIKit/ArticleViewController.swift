//
//  ArticleViewController.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import Foundation
import UIKit

class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var articles: [Article] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "News Feed"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        NewsAPIService.shared.fetchArticles { [weak self] fetched in
            DispatchQueue.main.async {
                self?.articles = fetched
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    /*
     
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = article.title
        content.secondaryText = article.description
        cell.contentConfiguration = content
        return cell
    }
    
    /*
     
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        
        if let url = URL(string: article.url) {
            UIApplication.shared.open(url)
        }
    }
    
}


