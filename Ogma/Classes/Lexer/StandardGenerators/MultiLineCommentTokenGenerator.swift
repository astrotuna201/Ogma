//
//  MultiLineCommentTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/25/19.
//

import Foundation

public struct MultiLineComment: TokenProtocol {
    public let text: String
}

public struct MultiLineCommentTokenGenerator: RegexTokenGeneratorProtocol {
    public typealias Token = MultiLineComment

    let prefixPattern: String
    let postfixPattern: String

    public var pattern: String {
        return "\(prefixPattern)\\s*((?:(?!\(postfixPattern))(.|\\n))*)\\s*\(postfixPattern)"
    }

    public let group: Int = 1

    public init(prefixPattern: String, postfixPattern: String) {
        self.prefixPattern = prefixPattern
        self.postfixPattern = postfixPattern
    }

    public func token(from matched: String) throws -> MultiLineComment? {
        return MultiLineComment(text: matched)
    }
}
