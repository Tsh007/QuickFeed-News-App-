//
//  ArticleStackView.swift
//  QuickFeed
//
//  Created by Tejash Singh on 22/04/24.
//

import SwiftUI

struct ArticleStackView: View {
    @EnvironmentObject var articleBookmarkVM: ArticleBookmarkViewModel
    
    
    
    let articles : [Article]
    @State var selectedArticle: Article?
    
    var body: some View {
        //actual ui of news app is different that i can recreate but for a change i have added a headlines(category text at top of view and due to which i have to add specific height for the card but in the actual app card is of infinite height occupying full height
        //
            ZStack{
                ForEach(articles){article in
                    CardView(article: article)
                        .onTapGesture {
                            selectedArticle = article
                        }
                        
                }
            }
        
        .sheet(item: $selectedArticle) {
            SafariWebView(url: $0.articleURL)
                .ignoresSafeArea()
        }
    }
}


//struct ArticleStackView_Previews: PreviewProvider{
//    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared
//    static var previews: some View{
//        ArticleStackView(articles: Article.previewData)
//            .environmentObject(articleBookmarkVM)
//    }
//}
