//
//  MorseCipher.swift
//  SpyApp
//
//  Created by Jimmy Clark on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

/*
 Translates Alphanumeric strings (A-Z, 0-9) into morse code
 Only accepts single words without spaces
 Does not use a secret key
 
 ***Double-dash Bug Fix: When typing in two dashes, iOS 11 will automatically turn these two dashes into one long dash, which is considered an invalid character. To turn this setting off, please go to Settings -> General -> Keyboard -> Turn off Smart Punctuation
 
 
 Example:
 
 Encode:
 Input: Hello
 Output: .... . .-.. .-.. ---
 
 Decrypt:
 Input: .... . .-.. .-.. ---
 Output: HELLO
 
 */
struct MorseCipher: Cipher{
    //determines if input is alphanumeric (A-Z, a-z, 0-9)
    func isAlphanumeric(input: String) -> Bool {
        return input.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && input != ""
    }
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        //initialize alphanumeric character to Morse code dictionary
        let alphaToMorse: Dictionary<String, String> = [
            "0" : "-----",
            "1" : ".----",
            "2" : "..---",
            "3" : "...--",
            "4" : "....-",
            "5" : ".....",
            "6" : "-....",
            "7" : "--...",
            "8" : "---..",
            "9" : "----.",
            "A" : ".-",
            "B" : "-...",
            "C" : "-.-.",
            "D" : "-..",
            "E" : ".",
            "F" : "..-.",
            "G" : "--.",
            "H" : "....",
            "I" : "..",
            "J" : ".---",
            "K" : "-.-",
            "L" : ".-..",
            "M" : "--",
            "N" : "-.",
            "O" : "---",
            "P" : ".--.",
            "Q" : "--.-",
            "R" : ".-.",
            "S" : "...",
            "T" : "-",
            "U" : "..-",
            "V" : "...-",
            "W" : ".--",
            "X" : "-..-",
            "Y" : "-.--",
            "Z" : "--.."]
        
        //is input alphnumeric?
        if !isAlphanumeric(input: plaintext) {
            return "Input is not alphanumeric! (A-Z, a-z, 0-9)"
        }
        
        //convert to uppercase
        let input = plaintext.uppercased()
        
        //output
        var encoded = ""
        
        //converts all characters
        for character in input{
            //gets corresponding morse code for the character
            let morseCode = alphaToMorse[String(character)]
            
            //appends the morse code to the output + a space
            encoded = encoded + morseCode! + " "
            
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        
        //initialize Morse code to alphanumeric character dictionary
        let morseToAlpha: Dictionary<String, String> = [
            "-----" : "0",
            ".----" : "1",
            "..---" : "2",
            "...--" : "3",
            "....-" : "4",
            "....." : "5",
            "-...." : "6",
            "--..." : "7",
            "---.." : "8",
            "----." : "9",
            ".-"    : "A",
            "-..."  : "B",
            "-.-."  : "C",
            "-.."   : "D",
            "."     : "E",
            "..-."  : "F",
            "--."   : "G",
            "...."  : "H",
            ".."    : "I",
            ".---"  : "J",
            "-.-"   : "K",
            ".-.."  : "L",
            "--"    : "M",
            "-."    : "N",
            "---"   : "O",
            ".--."  : "P",
            "--.-"  : "Q",
            ".-."   : "R",
            "..."   : "S",
            "-"     : "T",
            "..-"   : "U",
            "...-"  : "V",
            ".--"   : "W",
            "-..-"  : "X",
            "-.--"  : "Y",
            "--.."  : "Z"]
        
        
        for character in plaintext{
            //if input contains a character other than ".", "-", or " ": return error
            if (character != ".") && (character != "-") && (character != " ") {
                return "Invalid input: Morse code only consists of periods (.), dashes (-), and spaces ( )"
            }
        }
        
        //splits input string into an array, using " " as delimiter
        let codesArray = plaintext.components(separatedBy: " ")
        
        //output
        var decrypted = ""
        
        //converts all codes
        for code in codesArray{
            //gets corresponding character for code. If code is not in dictionary: return error
            guard let converted = morseToAlpha[code] else {
                return "Invalid code entered"
            }
            
            //appened character to output
            decrypted = decrypted + converted
        }
        return decrypted
    }
    
    
}
