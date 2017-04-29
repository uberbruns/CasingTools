# CasingTools

[![Swift][swift-badge]][swift-url]
[![License][mit-badge]][mit-url]
[![Build Status][travis-badge]][travis-url]

CasingTools is a Swift Library you can use to change the casing of strings. Supported casing formats include a wide variety of options from camelCase to UPPER_SNAIL_CASE. The library is also able to split strings into words that have no spacing and can also detect abbreviations (sequences of uppercase letters) and handles them correctly.

## Examples and Usage

```swift
// lowerCamelCase
Casing.lowerCamelCase("Some people tell Me that I need HELP!") // -> "somePeopleTellMeThatINeedHELP"
Casing.lowerCamelCase("Some-Pêöple\nTellMe??ThatINeedHELP ") // -> "somePeopleTellMeThatINeedHELP"

// UpperCamelCase
Casing.upperCamelCase("Some people tell Me that I need HELP!") // -> "SomePeopleTellMeThatINeedHELP"
Casing.upperCamelCase("Some-Pêöple\nTellMe??ThatINeedHELP ") // -> "SomePeopleTellMeThatINeedHELP"

// lower-train-case
Casing.lowercaseTrainCase("Some people tell Me that I need HELP!") // -> "some-people-tell-me-that-i-need-help"
Casing.lowercaseTrainCase("Some-Pêöple\nTellMe??ThatINeedHELP ") // -> "some-people-tell-me-that-i-need-help"

// UPPER-TRAIN-CASE
Casing.uppercaseTrainCase("Some people tell Me that I need HELP!") // -> "SOME-PEOPLE-TELL-ME-THAT-I-NEED-HELP"
Casing.uppercaseTrainCase("Some-Pêöple\nTellMe??ThatINeedHELP ") // -> "SOME-PEOPLE-TELL-ME-THAT-I-NEED-HELP"

// lowercase_snail_case
Casing.lowercaseSnailCase("Some people tell Me that I need HELP!") // -> "some_people_tell_me_that_i_need_help"
Casing.lowercaseSnailCase("Some-Pêöple\nTellMe??ThatINeedHELP ") // -> "some_people_tell_me_that_i_need_help"

// UPPERCASE_SNAIL_CASE
Casing.uppercaseSnailCase("Some people tell Me that I need HELP!") // -> "SOME_PEOPLE_TELL_ME_THAT_I_NEED_HELP"
Casing.uppercaseSnailCase("Some-Pêöple\nTellMe??ThatINeedHELP ") // -> "SOME_PEOPLE_TELL_ME_THAT_I_NEED_HELP"

// ["Split", "into", "words"]
Casing.splitIntoWords("Some people tell Me that I need HELP!") // -> ["Some", "people", "tell", "Me", "that", "I", "need", "HELP"]
Casing.splitIntoWords("Some-Pêöple\nTellMe??ThatINeedHELP ") // -> ["Some", "People", "Tell", "Me", "That", "I", "Need", "HELP"]
```

## Extending CasingTools

```swift
extension Casing {
    public static func doubleClapCase(_ string: String) -> String {
        var result = ""
        parseCharacters(in: string) { character in
            if character.isFirstLetter && !character.isInFirstWord {
                result += " 👏👏 "
            }
            result += character.uppercased()
        }
        return result
    }
}
```

```swift
print(Casing.doubleClapCase("Some people tell Me that I need HELP!"))
// -> SOME 👏👏 PEOPLE 👏👏 TELL 👏👏 ME 👏👏 THAT 👏👏 I 👏👏 NEED 👏👏 HELP
```

## License

This project is released under the MIT license. See [LICENSE](LICENSE) for details.

[swift-badge]: https://img.shields.io/badge/Swift-3.1-orange.svg?style=flat
[swift-url]: https://swift.org
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
[travis-badge]: https://travis-ci.org/uberbruns/CasingTools.svg?branch=master
[travis-url]: https://travis-ci.org/uberbruns/CasingTools
