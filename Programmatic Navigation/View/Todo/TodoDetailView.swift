//
//  PostDetailView.swift
//  Navigation Path Tutorial
//
//  Created by Fatih Durmaz on 26.07.2024.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: Todo
    @Environment(Router.self) private var router

    var body: some View {
        VStack (alignment: .center) {
            Text(todo.title)
                .font(.largeTitle)
            
            Text(todo.completed ? "Tamamlandı" : "Tamamlanmadı")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .blue, .yellow, .pink]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(
                        Text(todo.completed ? "Tamamlandı" : "Tamamlanmadı")
                            .font(.title)
                            .fontWeight(.bold)
                    )
                )
        }
        .toolbar {
            ToolbarItem {
                
                
                
                Button("Go to Root"){
                    router.navigateToRoot()
                }
                
                
            }
        }
        .navigationTitle("Todo Detail")
        
    }
}

#Preview {
    TodoDetailView(todo: Todo(id: 23, title: "Ofis alışverişi yapılacak.", completed: false))
        .environment(Router())

}
