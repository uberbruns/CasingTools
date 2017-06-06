//
//  CasingTools.swift
//  CasingTools
//
//  Created by Karsten Bruns on 2017-04-29.
//  Copyright © 2017 CasingTools. All rights reserved.
//

import Foundation

public struct Casing {

    // MARK: Constants

    private static let uppercaseLetters = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ".unicodeScalars)
    private static let lowercaseLetters = Set("abcdefghijklmnopqrstuvwxyz".unicodeScalars)


    // MARK: Subtypes

    public typealias AnnotatedCharacterHandler = (AnnotatedCharacter) -> ()

    public struct AnnotatedCharacter {
        public let original: String
        public let isFirstLetter: Bool
        public let isInFirstWord: Bool
        public let isUppercase: Bool

        public func lowercased() -> String {
            if isUppercase {
                return original.lowercased()
            } else {
                return original
            }
        }

        public func uppercased() -> String {
            if isUppercase {
                return original
            } else {
                return original.uppercased()
            }
        }
    }


    // MARK: Parsing

    public static func parseCharacters(in string: String, with annotatedCharacterHandler: AnnotatedCharacterHandler) {
        guard let asciiData = string.data(using: .ascii, allowLossyConversion: true) else { return }
        guard let asciiString = String(data: asciiData, encoding: .ascii) else { return }

        let characters = asciiString.unicodeScalars
        var beginNewWord = true
        var isFirstLetterInString = true
        var isInFirstWord = true
        var lastWasLowercase = false

        for index in characters.indices {
            let character = characters[index]
            let isUppercase: Bool

            if uppercaseLetters.contains(character) {
                // Its a uppercase character
                isUppercase = true
            } else if lowercaseLetters.contains(character) {
                // Its a lowercase character
                isUppercase = false
            } else {
                // Its not an alphanumeric character
                lastWasLowercase = false
                beginNewWord = true
                continue
            }

            // An uppercase letter might start a new word
            if !beginNewWord && isUppercase {
                // Is the next one lowercase?
                let nextIsLowercase: Bool
                if index != characters.index(before: characters.endIndex) {
                    let nextCharacter = characters[characters.index(after: index)]
                    nextIsLowercase = lowercaseLetters.contains(nextCharacter)
                } else {
                    nextIsLowercase = false
                }

                if (nextIsLowercase || lastWasLowercase) {
                    beginNewWord = true
                }
            }

            if beginNewWord {
                // `isInFirstWord` stays true until we hit the first letter
                // of the second word
                if isFirstLetterInString {
                    isFirstLetterInString = false
                } else {
                    isInFirstWord = false
                }
            }

            // Execute user function with character infos
            let newCharacter = String(character)
            let characterInfo = AnnotatedCharacter(original: newCharacter, isFirstLetter: beginNewWord, isInFirstWord: isInFirstWord, isUppercase: isUppercase)
            annotatedCharacterHandler(characterInfo)

            // Update parsing state
            lastWasLowercase = !isUppercase
            beginNewWord = false
        }
    }


    // MARK: String Helper

    public static func lowercaseFirstLetter(_ string: String) -> String {
        let characters = string.unicodeScalars
        guard characters.count > 0 else { return string }
        let index = characters.index(after: characters.startIndex)
        let firstLetter = String(characters.prefix(upTo: index))
        let rest = String(characters.suffix(from: index))
        return firstLetter.lowercased() + rest
    }


    public static func uppercaseFirstLetter(_ string: String) -> String {
        let characters = string.unicodeScalars
        guard characters.count > 0 else { return string }
        let index = characters.index(after: characters.startIndex)
        let firstLetter = String(characters.prefix(upTo: index))
        let rest = String(characters.suffix(from: index))
        return firstLetter.uppercased() + rest
    }


    public static func singularString(_ string: String) -> String {
        if string.characters.last == "s" {
            return String(string.characters.dropLast())
        } else {
            return string
        }
    }


    // MARK: Word-Based Transforms

    public static func splitIntoWords(_ string: String) -> [String] {
        var words: [String] = []

        parseCharacters(in: string) { character in
            if character.isFirstLetter {
                words.append(character.original)
            } else {
                words[words.endIndex-1] += character.original
            }
        }

        return words
    }


    private static func transform(_ words: inout [String], transform: (Int, String) -> String) {
        for (index, string) in words.enumerated() {
            words[index] = transform(index, string)
        }
    }


    public static func lowerCamelCase(_ words: inout [String]) {
        transform(&words) { index, word -> String in
            if index == 0 {
                return word.lowercased()
            } else {
                return Casing.uppercaseFirstLetter(word)
            }
        }
    }


    public static func upperCamelCase(_ words: inout [String]) {
        transform(&words) { _, word -> String in
            return Casing.uppercaseFirstLetter(word)
        }
    }


    public static func uppercase(_ words: inout [String]) {
        transform(&words) { _, word -> String in
            return word.uppercased()
        }
    }


    public static func lowercase(_ words: inout [String]) {
        transform(&words) { _, word -> String in
            return word.lowercased()
        }
    }


    // MARK: Character-Based Transforms

    public static func lowerCamelCase(_ string: String) -> String {
        var result = ""
        parseCharacters(in: string) { character in
            if character.isInFirstWord {
                result += character.lowercased()
            } else {
                if character.isFirstLetter {
                    result += character.uppercased()
                } else {
                    result += character.original
                }
            }
        }
        return result
    }


    public static func upperCamelCase(_ string: String) -> String {
        var result = ""
        parseCharacters(in: string) { character in
            if character.isFirstLetter {
                result += character.uppercased()
            } else {
                result += character.original
            }
        }
        return result
    }


    public static func uppercaseTrainCase(_ string: String) -> String {
        var result = ""
        parseCharacters(in: string) { character in
            if character.isFirstLetter && !character.isInFirstWord {
                result += "-"
            }
            result += character.uppercased()
        }
        return result
    }


    public static func lowercaseTrainCase(_ string: String) -> String {
        var result = ""
        parseCharacters(in: string) { character in
            if character.isFirstLetter && !character.isInFirstWord {
                result += "-"
            }
            result += character.lowercased()
        }
        return result
    }


    public static func uppercaseSnailCase(_ string: String) -> String {
        var result = ""
        parseCharacters(in: string) { character in
            if character.isFirstLetter && !character.isInFirstWord {
                result += "_"
            }
            result += character.uppercased()
        }
        return result
    }


    public static func lowercaseSnailCase(_ string: String) -> String {
        var result = ""
        parseCharacters(in: string) { character in
            if character.isFirstLetter && !character.isInFirstWord {
                result += "_"
            }
            result += character.lowercased()
        }
        return result
    }
}
