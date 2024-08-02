//
//  ContentView.swift
//  Programmatic Navigation
//
//  Created by Fatih Durmaz on 31.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    @Environment(Router.self) private var router
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.navPath) {
            VStack {
                List{
                    
                    
                    NavigationLink(value: Router.Destination.todos(.list)) {
                        Label {
                            Text("Todos")
                        } icon: {
                            Image(systemName: "list.bullet.clipboard")
                                .foregroundColor(.orange)
                        }
                    }
                    
                    
                    Label {
                        Text("Posts")
                    } icon: {
                        Image(systemName: "newspaper")
                            .foregroundColor(.teal)
                    }
                    .onTapGesture {
                        router.navigate(to: .posts(.list))
                    }
                    
                    Label {
                        Text("Settings")
                    } icon: {
                        Image(systemName: "gearshape")
                            .foregroundColor(.brown)
                    }
                    .onTapGesture {
                        router.navigate(to: .settings)
                    }
                    
                    Label {
                        Text("Custom View with Parameter")
                    } icon: {
                        Image(systemName: "circle")
                            .foregroundColor(.red)
                    }
                    .onTapGesture {
                        router.navigate(to: .custom(message: "Hello Custom View"))
                    }
                    
                }
            }
            .navigationTitle("Navigation Stack")
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .todos(let todoDestination):
                    switch todoDestination {
                    case .list:
                        TodoListView()
                    case .detail(let todo):
                        TodoDetailView(todo: todo)
                    }
                case .posts(let postDestination):
                    switch postDestination {
                    case .list:
                        PostListView()
                    case .detail(let post):
                        PostDetailView(post: post)
                    }
                    
                case .settings:
                    SettingsView()
                case .custom(let message):
                    CustomView(message: message )
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
