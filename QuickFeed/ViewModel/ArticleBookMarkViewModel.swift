//
//  ArticleBookMarkViewModel.swift
//  QuickFeed
//
//  Created by Tejash Singh on 26/04/24.
//

import SwiftUI

@MainActor
class ArticleBookmarkViewModel: ObservableObject {

    @Published private(set) var bookmarks: [Article] = []
    
    private let bookmarkStore = PlistDataStore<[Article]>(filename: "bookmarks")
    
    static let shared = ArticleBookmarkViewModel()
    private init() {
        Task {
            await load()
        }
    }
    
    func load() async {
        bookmarks = await bookmarkStore.load() ?? []
    }
    
    func isBookmarked(for article: Article) -> Bool {


        if bookmarks.contains(article){
            return true
        }else{
            return false
        }
    }
    
    func addBookmark(for article: Article) {
        guard !isBookmarked(for: article) else {
            return
        }

        bookmarks.insert(article, at: 0)
        bookmarkUpdated()
    }
    
    func removeBookmark(for article: Article) {
        guard let index = bookmarks.firstIndex(where: { $0.id == article.id }) else {
            return
        }
        bookmarks.remove(at: index)
        bookmarkUpdated()
    }
    
    private func bookmarkUpdated() {
        let bookmarks = self.bookmarks
        Task {
            await bookmarkStore.save(bookmarks)
        }
    }
}
