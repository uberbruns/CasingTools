//
//  CasingToolsTests.swift
//  CasingTools
//
//  Created by Karsten Bruns on 2017-04-29.
//  Copyright © 2017 CasingTools. All rights reserved.
//

import Foundation
import XCTest
import CasingTools


class CasingToolsTests: XCTestCase {

    static let allTests = [
        ("testLowerCamelCase", testLowerCamelCase),
        ("testLowercaseSnailCase", testLowercaseSnailCase),
        ("testLowercaseTrainCase", testLowercaseTrainCase),
        ("testUpperCamelCase", testUpperCamelCase),
        ("testUppercaseSnailCase", testUppercaseSnailCase),
        ("testUppercaseTrainCase", testUppercaseTrainCase),

        ("testComponentPerformance", testComponentPerformance),
        ("testUsagePerformance", testUsagePerformance),
        
        ("testEmpty", testEmpty),
    ]

    let testStringA = "Some people tell Me that I need HELP!"
    let testStringB = "SomePeopleTellMeThatINeedHELP"
    let testStringC = "Some-Pêöple\nTellMe??ThatINeedHELP "


    func testLowerCamelCase() {
        XCTAssertEqual(Casing.lowerCamelCase(testStringA), "somePeopleTellMeThatINeedHELP")
        XCTAssertEqual(Casing.lowerCamelCase(testStringB), "somePeopleTellMeThatINeedHELP")
        XCTAssertEqual(Casing.lowerCamelCase(testStringC), "somePeopleTellMeThatINeedHELP")
    }


    func testLowercaseSnailCase() {
        XCTAssertEqual(Casing.lowercaseSnailCase(testStringA), "some_people_tell_me_that_i_need_help")
        XCTAssertEqual(Casing.lowercaseSnailCase(testStringB), "some_people_tell_me_that_i_need_help")
        XCTAssertEqual(Casing.lowercaseSnailCase(testStringC), "some_people_tell_me_that_i_need_help")
    }


    func testLowercaseTrainCase() {
        XCTAssertEqual(Casing.lowercaseTrainCase(testStringA), "some-people-tell-me-that-i-need-help")
        XCTAssertEqual(Casing.lowercaseTrainCase(testStringB), "some-people-tell-me-that-i-need-help")
        XCTAssertEqual(Casing.lowercaseTrainCase(testStringC), "some-people-tell-me-that-i-need-help")
    }


    func testUpperCamelCase() {
        XCTAssertEqual(Casing.upperCamelCase(testStringA), "SomePeopleTellMeThatINeedHELP")
        XCTAssertEqual(Casing.upperCamelCase(testStringB), "SomePeopleTellMeThatINeedHELP")
        XCTAssertEqual(Casing.upperCamelCase(testStringC), "SomePeopleTellMeThatINeedHELP")
    }


    func testUppercaseSnailCase() {
        XCTAssertEqual(Casing.uppercaseSnailCase(testStringA), "SOME_PEOPLE_TELL_ME_THAT_I_NEED_HELP")
        XCTAssertEqual(Casing.uppercaseSnailCase(testStringB), "SOME_PEOPLE_TELL_ME_THAT_I_NEED_HELP")
        XCTAssertEqual(Casing.uppercaseSnailCase(testStringC), "SOME_PEOPLE_TELL_ME_THAT_I_NEED_HELP")
    }


    func testUppercaseTrainCase() {
        XCTAssertEqual(Casing.uppercaseTrainCase(testStringA), "SOME-PEOPLE-TELL-ME-THAT-I-NEED-HELP")
        XCTAssertEqual(Casing.uppercaseTrainCase(testStringB), "SOME-PEOPLE-TELL-ME-THAT-I-NEED-HELP")
        XCTAssertEqual(Casing.uppercaseTrainCase(testStringC), "SOME-PEOPLE-TELL-ME-THAT-I-NEED-HELP")

        print(Casing.splitIntoWords(testStringA))
        print(Casing.splitIntoWords(testStringC))
    }


    func testComponentPerformance() {
        let test = testStringA

        self.measure {
            for _ in 0..<10000 {
                _ = Casing.splitIntoWords(test)
            }
        }
    }


    func testUsagePerformance() {
        let test = testStringA

        self.measure {
            for _ in 0..<1000 {
                _ = Casing.lowerCamelCase(test)
                _ = Casing.lowercaseSnailCase(test)
                _ = Casing.lowercaseTrainCase(test)
                _ = Casing.upperCamelCase(test)
                _ = Casing.uppercaseSnailCase(test)
                _ = Casing.uppercaseTrainCase(test)
            }
        }
    }


    func testEmpty() {
        var test = ""
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "")

        test = " "
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "")

        test = "\n"
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "")

        test = " \n "
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "")

        test = "a"
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "a")

        test = "A"
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "a")

        test = "aa"
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "aa")

        test = "aA"
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "a_a")

        test = "Aa"
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "aa")
        
        test = "AA"
        XCTAssertTrue(Casing.lowercaseSnailCase(test) == "aa")
    }
}
