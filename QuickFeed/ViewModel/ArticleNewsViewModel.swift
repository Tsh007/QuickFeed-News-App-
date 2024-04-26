//
//  ArticleNewsViewModel.swift
//  QuickFeed
//
//  Created by Tejash Singh on 24/04/24.
//

import SwiftUI

enum DataFetchPhase<T> {
    
    case empty
    case success(T)
    case failure(Error)
}



//to run in main thread 
@MainActor
class ArticleNewsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var slectedCategory : Category

    private let newsAPI = NewsAPI.shared
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.slectedCategory = selectedCategory

    }
    
    func loadArticles() async {
//        phase = .success(Article.previewData)
        if Task.isCancelled { return }
        phase = .empty
        do {
            let articles = try await newsAPI.fetch(from: slectedCategory)
            if Task.isCancelled { return }
            phase = .success(articles)
        } catch {
            if Task.isCancelled { return }
            print(error.localizedDescription)
            phase = .failure(error)
        }
    }
}
