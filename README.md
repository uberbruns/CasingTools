# CasingTools

CasingTools is a Swift Library you can use to change the casing of strings. Supported casing formats include a wide variety of options from camelCase to UPPER_SNAIL_CASE. The library is also able to split strings into words that are formated without spacings and in can also detect abbreviations (sequences of uppercase letters).

## List of examples

| Casing Function | Input | Output |
|-----------------|-------|--------|
| `lowerCamelCase` | `"Some people tell Me that I need HELP!"` | `"somePeopleTellMeThatINeedHELP"` |
| `lowerCamelCase` | `"Some-Pêöple\nTellMe??ThatINeedHELP "` | `"somePeopleTellMeThatINeedHELP"` |
| `upperCamelCase` | `"Some people tell Me that I need HELP!"` | `"SomePeopleTellMeThatINeedHELP"` |
| `upperCamelCase` | `"Some-Pêöple\nTellMe??ThatINeedHELP "` | `"SomePeopleTellMeThatINeedHELP"` |
| `uppercaseTrainCase` | `"Some people tell Me that I need HELP!"` | `"SOME-PEOPLE-TELL-ME-THAT-I-NEED-HELP"` |
| `uppercaseTrainCase` | `"Some-Pêöple\nTellMe??ThatINeedHELP "` | `"SOME-PEOPLE-TELL-ME-THAT-I-NEED-HELP"` |
| `lowercaseTrainCase` | `"Some people tell Me that I need HELP!"` | `"some-people-tell-me-that-i-need-help"` |
| `lowercaseTrainCase` | `"Some-Pêöple\nTellMe??ThatINeedHELP "` | `"some-people-tell-me-that-i-need-help"` |
| `lowercaseTrainCase` | `"Some people tell Me that I need HELP!"` | `"some-people-tell-me-that-i-need-help"` |
| `lowercaseTrainCase` | `"Some-Pêöple\nTellMe??ThatINeedHELP "` | `"some-people-tell-me-that-i-need-help"` |
| `lowercaseSnailCase` | `"Some people tell Me that I need HELP!"` | `"some_people_tell_me_that_i_need_help"` |
| `lowercaseSnailCase` | `"Some-Pêöple\nTellMe??ThatINeedHELP "` | `"some_people_tell_me_that_i_need_help"` |
| `splitIntoWords` | `"Some people tell Me that I need HELP!"` | `["Some", "people", "tell", "Me", "that", "I", "need", "HELP"]` |
| `splitIntoWords` | `"Some-Pêöple\nTellMe??ThatINeedHELP "` | `["Some", "People", "Tell", "Me", "That", "I", "Need", "HELP"]` |


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
