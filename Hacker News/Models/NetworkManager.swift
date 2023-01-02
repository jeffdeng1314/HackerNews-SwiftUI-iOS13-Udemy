//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Jeff Deng on 12/30/22.
//

import Foundation

// ObservableObject can actually start broadcast one or many of its properties to any interested parties
class NetworkManager: ObservableObject {
    
    // publishing the property for the listeners
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // since we are using @Publish, the update must be happening in the main thread
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            })
            
            // starts the task
            task.resume()
        }
    }
}
