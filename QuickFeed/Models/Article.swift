import Foundation

struct Article : Codable , Identifiable, Equatable{
    
    let id = UUID()//to conform to identifiable
    
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
    
    
    //computed property for optionals
    var authorText: String {
        author ?? ""
    }
    var descriptionText: String {
        description ?? ""
    }
    
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
    
    var captionText: String {
            "\(source.name) ‧ "
    }
    
    var contentText: String{
        content ?? ""
    }
    
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        
//        print(previewDataURL)
        let data = try! Data(contentsOf: previewDataURL)
        
//        print(data)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiResponse.articles ?? []
    }
         
    
}


struct Source : Codable,Equatable {
    let name : String
}
