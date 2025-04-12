//
//  PollModel.swift
//  Polly
//
//  Created by Brinda Davda on 05/04/25.
//

import Foundation

public struct PollModel {
    
    public var title: String
    public var info: String?
    public var isMultipleChoice: Bool
    public var expiryDate: String
    
    public init(title: String, info: String?, isMultipleChoice: Bool = false, expiryDate: String) {
        self.title = title
        self.info = info
        self.isMultipleChoice = isMultipleChoice
        self.expiryDate = expiryDate
    }
}
