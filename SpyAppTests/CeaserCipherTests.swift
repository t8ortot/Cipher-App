import XCTest
@testable import SpyApp

class CeaserCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
    }
    
    /*
     encode tests
     */
    
    func test_eOneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_eNonNumericInputForSecret() {
        
        let expectedError = "Secret number must be equal to or greater than 0"
        
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertEqual (expectedError, result)
    }
    
    func test_eValueLessThanZero() {
        
        let expectedError = "Secret number must be equal to or greater than 0"
        
        let result = cipher.encode("Hello World!", secret: "-1234")
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eVeryLargeNumberForSecret() {
        
        let expectedError = "Secret number is too large!"
        
        let result = cipher.encode("Hello World!", secret: "432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_eHelloWorldWithSecret1 () {
        
        let plaintext = "Ifmmp!Xpsme\""
        
        let result = cipher.encode("Hello World!", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_eHelloWorldWithSecret4 (){
        
        let plaintext = "Lipps$[svph%"
        
        let result = cipher.encode("Hello World!", secret: "4")
        
        XCTAssertEqual(plaintext, result)
    }
    
    /*
 decrypt tests
 */
    
    func test_dOneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.decrypt(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_dNonNumericInputForSecret() {
        
        let expectedError = "Secret number must be equal to or greater than 0"
        
        let result = cipher.decrypt("b", secret: "nonNumericString")
        
        XCTAssertEqual (expectedError, result)
    }
    
    func test_dValueLessThanZero() {
        
        let expectedError = "Secret number must be equal to or greater than 0"
        
        let result = cipher.decrypt("Hello World!", secret: "-1234")
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dVeryLargeNumberForSecret() {
        
        let expectedError = "Secret number is too large!"
        
        let result = cipher.decrypt("Hello World!", secret: "432809829" )
        
        XCTAssertEqual(expectedError, result)
    }
    
    func test_dHelloWorldWithSecret1 () {
        
        let plaintext = "Hello World!"
        
        let result = cipher.decrypt("Ifmmp!Xpsme\"", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_dHelloWorldWithSecret4 (){
        
        let plaintext = "Hello World!"
        
        let result = cipher.decrypt("Lipps$[svph%", secret: "4")
        
        XCTAssertEqual(plaintext, result)
    }
}
