# Programmatic Navigation in SwiftUI

This project demonstrates how to implement programmatic navigation in a SwiftUI application using a Router class to manage navigation paths. The navigation in this project is controlled programmatically without relying solely on NavigationLink. This approach allows for more flexible and complex navigation flows.

**Project Structure**

***Router.swift:*** Contains the Router class that manages the navigation path and defines the possible destinations within the app.

***ContentView.swift:*** The main view that sets up the navigation stack and provides navigation options to different parts of the app.

**Router Class**

The Router class is responsible for handling navigation. It uses a NavigationPath to manage the stack of navigation destinations. The class defines various destinations and sub-destinations for the app.

``` swift
import Observation
import SwiftUI

@Observable
class Router {
    var navPath = NavigationPath()
    
    public enum Destination: Codable, Hashable {
        case todos(TodoDestination)
        case posts(PostDestination)
        case settings
        case custom(message: String)
    }
    
    public enum TodoDestination: Codable, Hashable {
        case list
        case detail(_ todo: Todo)
    }
    
    public enum PostDestination: Codable, Hashable {
        case list
        case detail(_ post: Post)
    }
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
```

**ContentView**

The ContentView sets up the navigation stack and provides buttons for navigating to different views. The navigation logic is handled using the Router class.

``` swift
import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    @Environment(Router.self) private var router
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.navPath) {
            VStack {
                List {
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
                    CustomView(message: message)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}

```

## Navigation Overview
- Todos: Navigates to a list of todos.
- Posts: Navigates to a list of posts.
- Settings: Navigates to the settings view.
- Custom View with Parameter: Navigates to a custom view with a message parameter.
- Each navigation option demonstrates different ways to handle navigation, either through a NavigationLink or programmatically using the Router class.
