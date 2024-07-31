//
//  Todo.swift
//  Programmatic Navigation
//
//  Created by Fatih Durmaz on 31.07.2024.
//

struct Todo: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let completed: Bool
}
