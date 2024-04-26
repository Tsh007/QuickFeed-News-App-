//
//  ContentView.swift
//  QuickFeed
//
//  Created by Tejash Singh on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    let articles: [Article]
    var body: some View {

        //we do'nt need tab view in our project for now making everything and will remove un necessary things at last
        
        TabView{
            NewsTabView()
                .tabItem{
                    Label("News",systemImage: "newspaper")
            }
            BookmarkTabView().tabItem{
                Label("saved",systemImage: "bookmark")
            }
            
        }

    }
}

//#Preview {
//    ContentView(articles: Article.previewData)
//}
