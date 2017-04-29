# CasingTools

CasingTools is a Swift Library you can use to change the casing of strings. Supported casing formats include a wide variety of options from camelCase to UPPER_SNAIL_CASE. The library is also able to split strings into words that are formated without spacings and in can also detect abbreviations (sequences of uppercase letters).

## List of examples

| Casing Function | Input | Output |
|-----------------|-------|--------|
| `lowerCamelCase` | `"SOME-Pêöple\nTellMe??ThatINeedHELP "` | `"somePeopleTellMeThatINeedHELP"` |
| `upperCamelCase` | `"SOME-Pêöple\nTellMe??ThatINeedHELP "` | `"SOMEPeopleTellMeThatINeedHELP"` |
| `uppercaseTrainCase` | `"SOME-Pêöple\nTellMe??ThatINeedHELP "` | `"SOME-PEOPLE-TELL-ME-THAT-I-NEED-HELP"` |
| `lowercaseTrainCase` | `"SOME-Pêöple\nTellMe??ThatINeedHELP "` | `"some-people-tell-me-that-i-need-help"` |
| `uppercaseSnailCase` | `"SOME-Pêöple\nTellMe??ThatINeedHELP "` | `"SOME_PEOPLE_TELL_ME_THAT_I_NEED_HELP"` |
| `lowercaseSnailCase` | `"SOME-Pêöple\nTellMe??ThatINeedHELP "` | `"some_people_tell_me_that_i_need_help"` |
