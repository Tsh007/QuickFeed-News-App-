//
//  EmptyPlaceholderView.swift
//  QuickFeed
//
//  Created by Tejash Singh on 24/04/24.
//

import Foundation

import SwiftUI

struct EmptyPlaceholderView: View {
    
    let text: String
    let image: Image?
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image = self.image {
                image
                    .imageScale(.large)
                    .font(.system(size: 52))
            }
            Text(text)
            Spacer()
        }
    }
    
}


