//
//  QuickFeedApp.swift
//  QuickFeed
//
//  Created by Tejash Singh on 21/04/24.
//

import SwiftUI

@main
struct QuickFeedApp: App {
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(articles: Article.previewData)
                .environmentObject(articleBookmarkVM)
        }
    }
}
