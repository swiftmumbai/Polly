//
//  ProfileModel.swift
//  Polly
//
//  Created by Brinda Davda on 05/04/25.
//

import Foundation

public struct ProfileModel {
    public var id: String?
    public var name: String
    public var joinedDate: String?
    public var votes: Int?
    
    init(id: String? = nil, name: String, joinedDate: String? = nil, votes: Int? = nil) {
        self.id = id
        self.name = name
        self.joinedDate = joinedDate
        self.votes = votes
    }
}
