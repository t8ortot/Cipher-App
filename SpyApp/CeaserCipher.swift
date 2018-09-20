import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ plaintext: String, secret: String) -> String?
}

/*
 Ceaser Cipher
 Takes characters from the input string and finds their corresponding system unicodes
 Adds the specified secret to the unicode
 Finds the character corresponding to the new unicode and appends it to the output
 
 Example:
 
 Encode:
 Input: Hello World!
 Key: 3
 Ouput: Khoor#Zruog$
 
 Decrypt:
 Input: Khoor#Zruog$
 Key: 3
 Output: Hello World!
 
 */
struct CeaserCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        //initializes secret as an UInt32
        guard let shiftBy = UInt32(secret) else {
            return "Secret number must be equal to or greater than 0"
        }
        
        if shiftBy > 40000{
            return "Secret number is too large!"
        }
        
        //output
        var encoded = ""
        
        //shifts all characters
        for character in plaintext {
            //gets unicode
            let unicode = character.unicodeScalars.first!.value
            //shifts unicode by secret
            let shiftedUnicode = unicode + shiftBy
            //converts unicode back into a character
            let shiftedCharacter = String(UnicodeScalar(UInt32(shiftedUnicode))!)
            //appends new character to output
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        
        //initializes secret as an UInt32
        guard let shiftBy = UInt32(secret) else {
            return "Secret number must be equal to or greater than 0"
        }
        
        if shiftBy > 40000{
            return "Secret number is too large!"
        }
        
        //output
        var decrypted = ""
        
        //unshifts all characters
        for character in plaintext {
            //gets unicode of character
            let unicode = character.unicodeScalars.first!.value
            //removes shift of secret from unicode
            let deshiftedUnicode = unicode - shiftBy
            //converts unicode back to character
            let deshiftedCharacter = String(UnicodeScalar(UInt32(deshiftedUnicode))!)
            //appends new character to output
            decrypted = decrypted + deshiftedCharacter
        }
        return decrypted
    }
}


