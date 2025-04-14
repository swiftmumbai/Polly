//
//  PollData.swift
//  Polly
//
//  Created by Midhet Sulemani on 14/04/25.
//

import Foundation

struct PollData: Identifiable {
    var choice: String
    var participants: Int
    
    var id: Int { participants }
    
    static let preview: [PollData] = [.init(choice: "Hello", participants: 4),
                                      .init(choice: "Hi", participants: 8),
                                      .init(choice: "Good Morning", participants: 12),
                                      .init(choice: "Namaste", participants: 16)
    ]
}
