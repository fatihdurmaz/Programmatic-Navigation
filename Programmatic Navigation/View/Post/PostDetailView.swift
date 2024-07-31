//
//  TodoDetailView.swift
//  Navigation Path Tutorial
//
//  Created by Fatih Durmaz on 26.07.2024.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
            
            Text(post.body)
                .font(.subheadline)
            
        }
        .padding()
        .toolbar {
            ToolbarItem {
                Button("Go to Root"){

                }
            }
        }
        .navigationTitle("Post Detail")
    }
}

#Preview {
    PostDetailView(post: Post(id: 23, title: "NavigationPath kullanarak dinamik yönlendirme", body: "SwiftUI'de NavigationStack, ekranlar arasında geçiş yapmanıza olanak tanır. NavigationPath ise dinamik olarak oluşturulan bir yol (path) ile bu geçişleri kontrol eder."))
}
