//
//  NewsAPIResponse.swift
//  QuickFeed
//
//  Created by Tejash Singh on 21/04/24.
//

import Foundation

struct NewsAPIResponse : Decodable{
    
    
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    //for bad request 
    let code: String?
    let message: String?
    
    
}
