//
//  main.swift
//  CasingTools
//
//  Created by Karsten Bruns on 10.11.18.
//  Copyright © 2018 bruns.me. All rights reserved.
//

import Foundation
import Moderator

let sampleText = "SoLong, andTHX_forAll the-fish!"
let arguments = Moderator(description: "Tool for transforming the casing of text.")

let casings: [String : (String) -> String] = [
    "lowerCamelCase": Casing.lowerCamelCase,
    "upperCamelCase": Casing.upperCamelCase,
    "uppercaseTrainCase": Casing.uppercaseTrainCase,
    "lowercaseTrainCase": Casing.lowercaseTrainCase,
    "uppercaseSnailCase": Casing.uppercaseSnailCase,
    "lowercaseSnailCase": Casing.lowercaseSnailCase,
    "titleCase": Casing.titleCase,
    "sentenceCase": Casing.sentenceCase,
]
let casingList = casings.keys.sorted()
var casingOptions = [FutureValue<Bool>]()


let stringOption = arguments.add(
    Argument<String>.optionWithValue("t", "text", name: "Text", description: "The input text you want to transform. For example: \"\(sampleText)\"")
)

let helpOption = arguments.add(
    Argument<String>.option("h", "help", description: "Prints this help page.")
)

for casingName in casingList {
    let casingFunc = casings[casingName]!
    let description = "Exemplary result: \"" + casingFunc("So long, and THX for all the fish!") + "\""
    let option = arguments.add(Argument<String>
        .option(casingName.lowercased(), description: description))
    casingOptions.append(option)
}

do {
    try arguments.parse()
    if let string = stringOption.value {
        for (index, casingOption) in casingOptions.enumerated() where casingOption.value {
            let casingName = casingList[index]
            let casingFunc = casings[casingName]!
            print(casingFunc(string))
            exit(0)
        }
    } else if helpOption.value {
        print(arguments.usagetext)
        exit(0)
    } else {
        print(arguments.usagetext)
        exit(1)
    }
} catch {
    print(error)
    exit(Int32(error._code))
}


