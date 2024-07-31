//
//  Post.swift
//  Programmatic Navigation
//
//  Created by Fatih Durmaz on 31.07.2024.
//

struct Post: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let body: String
}
