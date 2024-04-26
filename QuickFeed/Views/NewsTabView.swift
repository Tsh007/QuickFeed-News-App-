//
//  NewsTabView.swift
//  QuickFeed
//
//  Created by Tejash Singh on 24/04/24.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    
    
    //we do'nt need tab view in our project for now making everything and will remove un necessary things at last
    
    var body: some View {
        //actual ui of news app is different that i can recreate but for a change i have added a headlines(category text at top of view and due to which i have to add specific height for the card but in the actual app card is of infinite height occupying full height
        //
        NavigationView{
                ArticleStackView(articles: articles)
                //                    .overlay(overlayView)
                //                .refreshable {
                //                    loadTask()
                //                }
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("refresh", systemImage: "goforward") {
                                loadTask()
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            menu
                        }
                        
                        
                    }
                    .onChange(of: articleNewsVM.slectedCategory) { _ in
                        loadTask()
                    }
                    .onAppear{
                        loadTask()
                    }
                    .navigationTitle(self.articleNewsVM.slectedCategory.text)
            
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch articleNewsVM.phase {
        case .empty:
            ProgressView()
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "No Articles", image: nil)
        case .failure(let error):
            RetryView(text: error.localizedDescription ) {
                loadTask()
            }
        default: EmptyView()
        }
        
    }
    
    private var articles: [Article]{
        if case let .success(articles) = articleNewsVM.phase{
            return articles
        }else {
            return []
        }
    }
    
    private func loadTask(){
        Task.init{
            await articleNewsVM.loadArticles()
        }
    }
    
    private var menu: some View{
        Menu{
            Picker("category", selection: $articleNewsVM.slectedCategory){
                ForEach(Category.allCases){
                    Text($0.text).tag($0)
                }
            }
        }label:{
            Image(systemName: "fiberchannel")
                .imageScale(.large)
        }
    }
}

#Preview {
    NewsTabView()
}
