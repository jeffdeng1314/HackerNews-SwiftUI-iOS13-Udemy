//
//  ContentView.swift
//  Hacker News
//
//  Created by Jeff Deng on 12/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            NavigationView{
                // For every single post in the posts, i will generate a Text(post.title)
                List(networkManager.posts) { post in
                    
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }
                .navigationTitle("Hacker News")
            }
            .onAppear {
                self.networkManager.fetchData()
            }
        }
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Hola"),
//    Post(id: "3", title: "你好")
//]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
