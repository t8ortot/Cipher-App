//
//  AlphanumericCeaserCipher.swift
//  SpyApp
//
//  Created by Jimmy Clark on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

/*
 Alphanumeric Caesar Cipher
 Only accepts alphanumeric input (A-Z, 0-9)
 Converts the input string's characters into corresponding unicodes, then shifts the unicode by the speficied secret, and then converts the shifted unicode back into its corresponding character.
 
 Example:
 
 Encode:
 Input: ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
 Key: 4
 Output:EFGHIJKLMNOPQRSTUVWXYZ0123456789ABCD
 
 Input: Hello
 Key: 2
 Output: JGNNQ
 
 Decrypt:
 Input: JGNNQ
 Key: 2
 Output: HELLO
 */
struct AlphanumericCeaserCipher: Cipher {
    
    //function to determine if input is alphanumeric (A-Z, a-z, 0-9)
    func isAlphanumeric(input: String) -> Bool {
        return input.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && input != ""
    }
    
    func encode(_ plaintext: String, secret: String) -> String?{
        
        //initialize alphanumeric character to assigned number dictionary
        let alphaToNum: Dictionary<String, Int> = [
            "0" : 0,
            "1" : 1,
            "2" : 2,
            "3" : 3,
            "4" : 4,
            "5" : 5,
            "6" : 6,
            "7" : 7,
            "8" : 8,
            "9" : 9,
            "A" : 10,
            "B" : 11,
            "C" : 12,
            "D" : 13,
            "E" : 14,
            "F" : 15,
            "G" : 16,
            "H" : 17,
            "I" : 18,
            "J" : 19,
            "K" : 20,
            "L" : 21,
            "M" : 22,
            "N" : 23,
            "O" : 24,
            "P" : 25,
            "Q" : 26,
            "R" : 27,
            "S" : 28,
            "T" : 29,
            "U" : 30,
            "V" : 31,
            "W" : 32,
            "X" : 33,
            "Y" : 34,
            "Z" : 35]
        
        //initialize assigned number to alphanumeric character dictionary
        let numToAlpha: Dictionary<Int, String> = [
            0 : "0",
            1 : "1",
            2 : "2",
            3 : "3",
            4 : "4",
            5 : "5",
            6 : "6",
            7 : "7",
            8 : "8",
            9 : "9",
            10 : "A",
            11 : "B",
            12 : "C",
            13 : "D",
            14 : "E",
            15 : "F",
            16 : "G",
            17 : "H",
            18 : "I",
            19 : "J",
            20 : "K",
            21 : "L",
            22 : "M",
            23 : "N",
            24 : "O",
            25 : "P",
            26 : "Q",
            27 : "R",
            28 : "S",
            29 : "T",
            30 : "U",
            31 : "V",
            32 : "W",
            33 : "X",
            34 : "Y",
            35 : "Z"]
        
        //is input alphanumeric?
        if !isAlphanumeric(input: plaintext) {
            return "Input is not alphanumeric! (A-Z, a-z, 0-9)"
        }
        
        //convert to uppercase
        let input = plaintext.uppercased()
        
        //initialize secret as integer
        guard let shiftBy = Int(secret) else {
            return "Secret is too large or is not a number!"
        }
        
        
        //output
        var encoded = ""
        //number of output char
        var shiftedNumber = 0
        
        //shifts all characters
        for character in input {
            //get corresponding number for character
            let number: Int? = alphaToNum[String(character)]
            //shift number by secret
            shiftedNumber = number! + shiftBy
            
            //keep new number within bounds of dictionaries
            while (shiftedNumber < 0 || shiftedNumber > 35){
                if shiftedNumber > 35{
                    shiftedNumber = (shiftedNumber % 36)
                } else if shiftedNumber < 0 {
                    shiftedNumber = 36 + shiftedNumber
                }
            }
            
            //get character correspondning to the new number
            let shiftedChar: String? = numToAlpha[shiftedNumber]
            
            //append new character to output
            encoded = encoded + shiftedChar!
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String?{
        
        //initialize alphanumeric character to assigned number dictionary
        let alphaToNum: Dictionary<String, Int> = [
            "0" : 0,
            "1" : 1,
            "2" : 2,
            "3" : 3,
            "4" : 4,
            "5" : 5,
            "6" : 6,
            "7" : 7,
            "8" : 8,
            "9" : 9,
            "A" : 10,
            "B" : 11,
            "C" : 12,
            "D" : 13,
            "E" : 14,
            "F" : 15,
            "G" : 16,
            "H" : 17,
            "I" : 18,
            "J" : 19,
            "K" : 20,
            "L" : 21,
            "M" : 22,
            "N" : 23,
            "O" : 24,
            "P" : 25,
            "Q" : 26,
            "R" : 27,
            "S" : 28,
            "T" : 29,
            "U" : 30,
            "V" : 31,
            "W" : 32,
            "X" : 33,
            "Y" : 34,
            "Z" : 35]
        
        //initialize assigned number to alphanumeric character dictionary
        let numToAlpha: Dictionary<Int, String> = [
            0 : "0",
            1 : "1",
            2 : "2",
            3 : "3",
            4 : "4",
            5 : "5",
            6 : "6",
            7 : "7",
            8 : "8",
            9 : "9",
            10 : "A",
            11 : "B",
            12 : "C",
            13 : "D",
            14 : "E",
            15 : "F",
            16 : "G",
            17 : "H",
            18 : "I",
            19 : "J",
            20 : "K",
            21 : "L",
            22 : "M",
            23 : "N",
            24 : "O",
            25 : "P",
            26 : "Q",
            27 : "R",
            28 : "S",
            29 : "T",
            30 : "U",
            31 : "V",
            32 : "W",
            33 : "X",
            34 : "Y",
            35 : "Z"]
        
        //is input alphnumeric?
        if !isAlphanumeric(input: plaintext) {
            return "Input is not alphanumeric! (A-Z, a-z, 0-9)"
        }
        
        //convert to uppercase
        let input = plaintext.uppercased()
        
        //initialize secret as integer
        guard let shiftBy = Int(secret) else {
            return "Secret is too large or is not a number!"
        }
        
        //output
        var decrypted = ""
        //number of output char
        var shiftedNumber = 0
        
        
        for character in input {
            //get corresponding number from dictionary
            let number: Int? = alphaToNum[String(character)]
            //shift the number by the secret
            shiftedNumber = number! - shiftBy
            
            //keep new number within bounds of the dictionaries
            while (shiftedNumber < 0 || shiftedNumber > 35){
                if shiftedNumber > 35{
                    shiftedNumber = (shiftedNumber % 36)
                } else if shiftedNumber < 0 {
                    shiftedNumber = 36 + shiftedNumber
                }
            }
            
            //get character that corresponds with number in dictionary
            let shiftedChar: String? = numToAlpha[shiftedNumber]
            
            //append output with new character
            decrypted = decrypted + shiftedChar!
        }
        return decrypted
    }
}



