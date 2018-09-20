//
//  AlphanumericCeaserCipher.swift
//  SpyAppTests
//
//  Created by Jimmy Clark on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphanumericCeaserCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphanumericCeaserCipher()
    }
    
    /*
     encode tests
     */
    
    func test_eNonAlphanumericInput() {
        
        let expectedError = "Input is not alphanumeric! (A-Z, a-z, 0-9)"
        
        let result = cipher.encode("Hello World", secret: "3")
        
        //the space in "Hello World" is not considered alphanumeric
        XCTAssertEqual(expectedError, result)
        
    }
    func test_eOneCharacterStirngGetsMappedToUppercaseSelfWith_0_secret() {
        
        let plaintext = "A"
        
        let result = cipher.encode("a", secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_eNonNumericInputForSecret() {
        
        let expectedError = "Secret is too large or is not a number!"
        
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertEqual (expectedError, result)
    }
    
    func test_eSecretValueLessThanZero() {
        
        let plaintext = "74BBEMEHB3"
        
        let result = cipher.encode("HelloWorld", secret: "-10")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_eVeryLargeNegativeNumberForSecret() {
        
        let expectedError = "85CCFNFIC4"
        
        let result = cipher.encode("HelloWorld", secret: "-432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eVeryLargeNumberForSecret() {
        
        let expectedError = "QNUUX5X0UM"
        
        let result = cipher.encode("HelloWorld", secret: "432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eHelloWorldWithSecret1 () {
        
        let plaintext = "IFMMPXPSME"
        
        let result = cipher.encode("HelloWorld", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_eHelloWorldWithSecret30 (){
        
        let plaintext = "B8FFIQILF7"
        
        let result = cipher.encode("HelloWorld", secret: "30")
        
        XCTAssertEqual(plaintext, result)
    }
    
    /*
     decrypt tests
     */
    
    func test_dNonAlphanumericInput() {
    
    let expectedError = "Input is not alphanumeric! (A-Z, a-z, 0-9)"
    
    let result = cipher.decrypt("Hello World", secret: "3")
    
    //the space in "Hello World" is not considered alphanumeric
    XCTAssertEqual(expectedError, result)
    
    }
    func test_dOneCharacterStirngGetsMappedToUppercaseSelfWith_0_secret() {
        
        let plaintext = "A"
        
        let result = cipher.decrypt("a", secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_dNonNumericInputForSecret() {
        
        let expectedError = "Secret is too large or is not a number!"
        
        let result = cipher.decrypt("b", secret: "nonNumericString")
        
        XCTAssertEqual (expectedError, result)
    }
    
    func test_dSecretValueLessThanZero() {
        
        let plaintext = "HELLOWORLD"
        
        let result = cipher.decrypt("74BBEMEHB3", secret: "-10")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_dVeryLargeNegativeNumberForSecret() {
        
        let expectedError = "HELLOWORLD"
        
        let result = cipher.decrypt("85CCFNFIC4", secret: "-432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dVeryLargeNumberForSecret() {
        
        let expectedError = "HELLOWORLD"
        
        let result = cipher.decrypt("QNUUX5X0UM", secret: "432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dHelloWorldWithSecret1 () {
        
        let plaintext = "HELLOWORLD"
        
        let result = cipher.decrypt("IFMMPXPSME", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_dHelloWorldWithSecret30 (){
        
        let plaintext = "HELLOWORLD"
        
        let result = cipher.decrypt("B8FFIQILF7", secret: "30")
        
        XCTAssertEqual(plaintext, result)
    }
}
