//
//  RailFenceCipherTests.swift
//  SpyAppTests
//
//  Created by Jimmy Clark on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class RailFenceCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = RailFenceCipher()
    }
    
    /*
     encode tests
     */
    
    func test_eSecret0() {
        
        let expectedError = "Secret must be greater than zero!"
        
        let result = cipher.encode("a", secret: "0")
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eNonNumericInputForSecret() {
        
        let expectedError = "Secret must be greater than zero!"
        
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertEqual (expectedError, result)
    }
    
    func test_eSecretValueLessThanZero() {
        
        let expectedError = "Secret must be greater than zero!"
        
        let result = cipher.encode("Hello World!", secret: "-10")
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eVeryLargeNegativeNumberForSecret() {
        
        let expectedError = "Secret must be greater than zero!"
        
        let result = cipher.encode("Hello World!", secret: "-432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eLargeNumberForSecret() {
        
        let expectedError = "The secret must be less than the number of characters in the input!"
        
        let result = cipher.encode("Hello World!", secret: "432" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eHelloWorldMappedToSelfWithSecret1 () {
        
        let plaintext = "Hello World!"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_eHelloWorldWithSecret3 (){
        
        let plaintext = "HlWleoodl r!"
        
        let result = cipher.encode("Hello World!", secret: "3")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_ePhaseWithSecret7() {
         let plaintext = "HohaFieri epllsRnhld aceo,iier  sl wt -C"
        
        let result = cipher.encode("Hello world, this is a Rail-Fence Cipher", secret: "7")
        
        XCTAssertEqual(plaintext, result)
    }
    
    /*
     decrypt tests
     */
    
    
    func test_dSecret0() {
        
        let expectedError = "Secret must be greater than zero!"
        
        let result = cipher.decrypt("a", secret: "0")
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dNonNumericInputForSecret() {
        
        let expectedError = "Secret must be greater than zero!"
        
        let result = cipher.decrypt("b", secret: "nonNumericString")
        
        XCTAssertEqual (expectedError, result)
    }
    
    func test_dSecretValueLessThanZero() {
        
        let expectedError = "Secret must be greater than zero!"
        
        let result = cipher.decrypt("Hello World!", secret: "-10")
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dVeryLargeNegativeNumberForSecret() {
        
        let expectedError = "Secret must be greater than zero!"
        
        let result = cipher.decrypt("Hello World!", secret: "-432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dLargeNumberForSecret() {
        
        let expectedError = "The secret must be less than the number of characters in the input!"
        
        let result = cipher.decrypt("Hello World!", secret: "432" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dHelloWorldMappedToSelfWithSecret1 () {
        
        let plaintext = "Hello World!"
        
        let result = cipher.decrypt(plaintext, secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_dHelloWorldWithSecret3 (){
        
        let plaintext = "Hello World!"
        
        let result = cipher.decrypt("HlWleoodl r!", secret: "3")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_dPhaseWithSecret7() {
        let plaintext = "Hello world, this is a Rail-Fence Cipher"
        
        let result = cipher.decrypt("HohaFieri epllsRnhld aceo,iier  sl wt -C", secret: "7")
        
        XCTAssertEqual(plaintext, result)
    }
    
}

