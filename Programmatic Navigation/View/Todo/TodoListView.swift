//
//  TodoListVew.swift
//  Navigation Path Tutorial
//
//  Created by Fatih Durmaz on 28.07.2024.
//

import SwiftUI

struct TodoListView: View {
    @State private var todos = [Todo]()
    @State private var isLoading = false
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            }else {
                List{
                    
                    ForEach(todos) { todo in
                        
                        
                        NavigationLink(value: Router.Destination.todos(.detail(todo))) {
                            HStack {
                                Image(systemName: "\(todo.id).circle")
                                    .font(.title)
                                    .foregroundStyle(.blue)
                                Text(todo.title)
                                Spacer()
                                Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(todo.completed ? .green : .black)
                                
                            }
                        }
                        


                        
                    }
                }
                
            }
            
        }
        .task {
            await fetchTodos()
        }
        .navigationTitle("Todos")
        .toolbar {
            ToolbarItem {
                Button("Go to Settings"){
                    router.navigate(to: .settings)
                }
            }
        }
    }
    
    func fetchTodos() async{
        isLoading = true
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let todos = try JSONDecoder().decode([Todo].self, from: data)
            self.todos = todos
            
        } catch {
            print(error.localizedDescription)
        }
        isLoading = false
    }
}

#Preview {
    TodoListView()
        .environment(Router())
    
}
