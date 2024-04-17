//
//  User.swift
//  ToDoListApp
//
//  Created by Nicholas Hurst on 4/17/24.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
