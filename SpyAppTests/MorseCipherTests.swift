//
//  MorseCipherTests.swift
//  SpyAppTests
//
//  Created by Jimmy Clark on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class MorseCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = MorseCipher()
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
    
    
    //Morse Cipher does not use secret, as shown in next three tests:
    
    func test_eVeryLargeNegativeNumberForSecret() {
        
        let expectedError = ".... . .-.. .-.. --- .-- --- .-. .-.. -.. "
        
        let result = cipher.encode("HelloWorld", secret: "-432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eOneCharacterWith_0_secret() {
        
        let plaintext = ".... . .-.. .-.. --- .-- --- .-. .-.. -.. "
        
        let result = cipher.encode("HelloWorld", secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_eVeryLargeNumberForSecret() {
        
        let expectedError = ".... . .-.. .-.. --- .-- --- .-. .-.. -.. "
        
        let result = cipher.encode("HelloWorld", secret: "432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    
    /*
     decrypt tests
     */
    
    func test_dMorseInput() {
        
        let expectedError = "Invalid input: Morse code only consists of periods (.), dashes (-), and spaces ( )"
        
        let result = cipher.decrypt("Hello World", secret: "3")
        
        //the space in "Hello World" is not considered alphanumeric
        XCTAssertEqual(expectedError, result)
        
    }
    
    
    //Morse Cipher does not use secret, as shown in next three tests:
    
    func test_dVeryLargeNegativeNumberForSecret() {
        
        let expectedError = "HELLOWORLD"
        
        let result = cipher.decrypt(".... . .-.. .-.. --- .-- --- .-. .-.. -..", secret: "-432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dOneCharacterWith_0_secret() {
        
        let plaintext = "HELLOWORLD"
        
        let result = cipher.decrypt(".... . .-.. .-.. --- .-- --- .-. .-.. -..", secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_dVeryLargeNumberForSecret() {
        
        let expectedError = "HELLOWORLD"
        
        let result = cipher.decrypt(".... . .-.. .-.. --- .-- --- .-. .-.. -..", secret: "432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    
}
