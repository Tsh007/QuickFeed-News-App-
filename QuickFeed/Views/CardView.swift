//
//  CardView.swift
//  QuickFeed
//
//  Created by Tejash Singh on 22/04/24.
//

import SwiftUI

struct CardView: View {
    
    let article : Article
//    let articles : [Article]
    
    @State var isPresented = false
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    @EnvironmentObject var articleBookmarkVM: ArticleBookmarkViewModel
    var body: some View {
        
        //actual ui of news app is different that i can recreate but for a change i have added a headlines(category text at top of view and due to which i have to add specific height for the card but in the actual app card is of infinite height occupying full height
        //
        ZStack {
            
            Rectangle()
                .frame(maxWidth:.infinity , maxHeight: 700)
                .cornerRadius(4)
                .shadow(radius: 4)
                .foregroundStyle(Color.white)
            
            VStack(alignment: .leading) {
                AsyncImage(url: article.imageURL){
                    phase in
                    switch phase{
                    case .empty:
                        HStack{
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fill)
                    case .failure:
                        HStack{
                            Spacer()
                            Image(systemName: "photo")
                            Spacer()
                        }
                    @unknown default:
                        fatalError()
                    }
                    
                }
                .frame(minWidth: 200,maxHeight: 250)
                .background(Color.gray)
                //solved bug
                .clipped()
//                Spacer()
                VStack(alignment: .leading) {
                    Text(article.title)
                    
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    //instead of plain text here make summarizer
                    Text(article.contentText)
                        .font(.system(size: 20))
                        .truncationMode(.tail)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
//                    Spacer()
                    HStack {
                        Text(article.captionText)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                            .font(.caption)
                        
                        Spacer()
                        
                        Button {
                            toggleBookmark(for: article)
                            print(articleBookmarkVM.isBookmarked(for: article))
                        } label: {
                            Image(systemName:  articleBookmarkVM.isBookmarked(for: article) ? "bookmark.fill" : "bookmark")
                            
                        }
                        .buttonStyle(.bordered)
                        
                        Button {
                            presentShareSheet(url: article.articleURL)
                            //                                    presentShareSheet(url: article.articleURL)
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .buttonStyle(.bordered)
                    }
                    Spacer()
                }
                .frame(maxHeight: 400)
                    .padding([.horizontal, .bottom])
            }
            .frame(maxHeight: 700)
            
            
            
            
        }
        .sheet(isPresented: $isPresented){
            SafariWebView(url: article.articleURL).ignoresSafeArea()
        }
        .offset(x: offset.width, y: offset.height)
        //        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
            
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        //                        changeColor(width: offset.width)
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        dragCard(value: offset)
                        
                    }
                }
        )
        
    }
    private func toggleBookmark(for article: Article){
        if articleBookmarkVM.isBookmarked(for: article){
            articleBookmarkVM.removeBookmark(for: article)
        }else{
            articleBookmarkVM.addBookmark(for: article)
        }
    }
    //    func swipeCard(width: CGFloat) {
    //        switch width {
    //        case -500...(-150):
    //            print("removed")
    //            offset = CGSize(width: -500, height: 0)
    //        case 150...500:
    //            print("added")
    //            offset = CGSize(width: 500, height: 0)
    //        default:
    //            offset = .zero
    //        }
    //    }
    //    func verticalSwipeCard(height: CGFloat){
    //        if height<0{
    //            print("moved up")
    //            offset = CGSize(width: 0, height: -1000)
    //        }else if height>0{
    //            print("moved down")
    //            offset = CGSize(width: 0, height: 1000)
    //        }else{
    //            print("not found what happened")
    //        }
    //    }
    
    func dragCard(value: CGSize){
        
        if abs(value.height) > abs(value.width){
            if value.height < 0{
                print("moved up")
                offset = CGSize(width: 0, height: -1000)
            }else if value.height > 0{
                print("moved Down")
                print("do nothing for now")
                offset = CGSize(width: 0 , height: 0)
//                offset = CGSize(width: 0, height: 1000)
            }
        }else{
            if value.width > 0{
                print("moved right")
                print("do nothing for now")
                offset = CGSize(width: 0 , height: 0)
//                offset = CGSize(width: 500, height: 0)
            }else if value.width < 0{
                print("moved left")
                offset = CGSize(width: 0 , height: 0)
//                offset = CGSize(width: -500, height: 0)
                isPresented = true
            }
        }
    }
    
    //    func changeColor(width: CGFloat) {
    //        switch width {
    //        case -500...(-130):
    //            color = .red
    //        case 130...500:
    //            color = .green
    //        default:
    //            color = .black
    //        }
    //    }
}


//MARK: - native share sheet view by ios
extension View{
    func presentShareSheet(url: URL){
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .keyWindow?
            .rootViewController?
            .present(activityVC, animated: true)
    }
}

//


