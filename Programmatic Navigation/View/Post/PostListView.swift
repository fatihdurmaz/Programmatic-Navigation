//
//  TodoListView.swift
//  Navigation Path Tutorial
//
//  Created by Fatih Durmaz on 28.07.2024.
//

import SwiftUI

struct PostListView: View {
    @State private var posts = [Post]()
    @State private var isLoading = false
    @Environment(Router.self) private var router

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            }else {
                List{
                    
                    ForEach(posts) { post in
                        
                        HStack {
                            Image(systemName: "\(post.id).circle")
                                .font(.title)
                                .foregroundStyle(.orange)
                            Text(post.title)
                        }
                        .onTapGesture {
                            router.navigate(to: .posts(.detail(post)))
                        }
                    }
                }
            }
            
        }
        .task {
            await fetchPosts()
        }
        .navigationTitle("Posts")
        
    }
    
    func fetchPosts() async{
        isLoading = true
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let posts = try JSONDecoder().decode([Post].self, from: data)
            self.posts = posts
            
        } catch {
            print(error.localizedDescription)
        }
        isLoading = false
    }
}

#Preview {
    PostListView()
        .environment(Router())
}
