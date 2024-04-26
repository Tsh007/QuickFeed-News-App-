//
//  BookmarkTabView.swift
//  QuickFeed
//
//  Created by Tejash Singh on 26/04/24.
//

import SwiftUI

struct BookmarkTabView : View{
    
    @EnvironmentObject var articleBookmarkVM : ArticleBookmarkViewModel
    
    
    var body: some View{
        NavigationView{
            ArticleStackView(articles: articleBookmarkVM.bookmarks)
                .overlay(overlayView(isEmpty: articleBookmarkVM.bookmarks.isEmpty))
                .navigationTitle("Saved Articles")
        }
        .onAppear{
            newLoad()
        }
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool)-> some View {
        if isEmpty{
            EmptyPlaceholderView(text: "No Saved", image: Image(systemName: "bookmark"))
        }
    }
    
    func newLoad() {
        Task{
            await self.articleBookmarkVM.load()
        }
    }
}

//struct BookmarkTabView_Preview: PreviewProvider{
//    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared
//    
//    static var previews: some View{
//        BookmarkTabView().environmentObject(articleBookmarkVM)
//    }
//}

