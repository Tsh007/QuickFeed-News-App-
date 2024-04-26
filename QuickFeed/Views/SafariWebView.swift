//
//  SafariWebView.swift
//  QuickFeed
//
//  Created by Tejash Singh on 24/04/24.
//

import SwiftUI
import SafariServices


struct SafariWebView: UIViewControllerRepresentable {
    
    let url : URL
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

