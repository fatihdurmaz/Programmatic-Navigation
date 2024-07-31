//
//  CustomView.swift
//  Programmatic Navigation
//
//  Created by Fatih Durmaz on 31.07.2024.
//

import SwiftUI

struct CustomView: View {
    let message: String
    @Environment(Router.self) private var router

    var body: some View {
        VStack{
            Spacer()
            Text(message)
                .font(.largeTitle)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem {
                Button("Go to Root"){
                    router.navigateToRoot()
                }
            }
        }
        .navigationTitle("Custom View")
        .safeAreaInset(edge: .bottom) {
            
            Text("Go to Todo List View")
                .frame(maxWidth: .infinity)
                .padding(.top, 10)
                .foregroundStyle(.white)
                .bold()
                .background(.blue)
                .onTapGesture {
                    router.navigate(to: .todos(.list))
                }
            
            
        }
    }
}

#Preview {
    CustomView(message: "Gelen Veri")
        .environment(Router())
}
