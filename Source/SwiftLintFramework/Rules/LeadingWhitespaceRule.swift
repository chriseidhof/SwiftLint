//
//  LeadingWhitespaceRule.swift
//  SwiftLint
//
//  Created by JP Simard on 2015-05-16.
//  Copyright (c) 2015 Realm. All rights reserved.
//

import SourceKittenFramework

struct LeadingWhitespaceRule: Rule {
    let identifier = "leading_whitespace"
    let parameters = [RuleParameter<Void>]()

    func validateFile(file: File) -> [StyleViolation] {
        let countOfLeadingWhitespace = file.contents.countOfLeadingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        if countOfLeadingWhitespace != 0 {
            return [StyleViolation(type: .LeadingWhitespace,
                location: Location(file: file.path, line: 1),
                severity: .Medium,
                reason: "File shouldn't start with whitespace: " +
                "currently starts with \(countOfLeadingWhitespace) whitespace characters")]
        }
        return []
    }

    let example: RuleExample? = nil
}
