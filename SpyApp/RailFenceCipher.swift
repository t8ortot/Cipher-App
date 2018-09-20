//
//  RailFenceCipher.swift
//  SpyApp
//
//  Created by Jimmy Clark on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation


/*
 Modified Rail-fence cipher
 Takes the input and secret
 The secret must be less than the number of characters in the input
 Creates secret amount of rows
 Writes the input, descending a row each character, and loops to back to the top
 Combines rows into one string and outputs the string
 
 Example:
 
 Encode:
 Input: Hello World!
 Secret: 3
 Row 1: H . . l . . W . . l . .
 Row 2: . e . . o . . o . . d .
 Row 3: . . l . .   . . r . . !
 
 Output = HlWl + eood + l r! = HlWleoodl r!
 
 
 Decrypt:
 Input: HlWleoodl r!
 Secret: 3
 Row:  1    2    3
 HlWl-eood-l r!
 
 Pops the nth character from each row starting at 0 until n = (input.count / secret) + 1
 Output: Hello World!
 */
struct RailFenceCipher: Cipher{
    func encode(_ plaintext: String, secret: String) -> String? {
        
        //initialize secret as positive integer
        guard let key = UInt32(secret) else {
            return "Secret must be greater than zero!"
        }
        
        if key >= plaintext.count{
            return "The secret must be less than the number of characters in the input!"
        }
        
        //if the key is 0, we cannot run the encoding, because the program will attempt to create an array with zero elements
        if key != 0{
            
            //creates an array for row's strings to be stored
            var subStrings = Array(repeating: "", count: Int(key))
            
            //counter for determining index
            var i: Int = 0
            for character in plaintext{
                //calculates the index where the next character should be appended
                let index = i % (Int(key))
                
                //appends the character
                subStrings[index] = subStrings[index] + String(character)
                i += 1
            }
            
            //output
            var encoded = ""
            
            //combines the rows into one string
            for element in subStrings{
                encoded = encoded + element
            }
            return encoded
        } else {
            return "Secret must be greater than zero!"
        }
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        
        //intitializes secret as a positive integer
        guard let key = UInt32(secret) else {
            return "Secret must be greater than zero!"
        }
        
        if key >= plaintext.count{
            return "The secret must be less than the number of characters in the input!"
        }
        
        //output
        var decrypted = ""
        
        //program will attempt to create an array with 0 elements if the secret is 0
        if key != 0{
            //array to hold row strings
            var subStrings = Array(repeating: "", count: Int(key))
            
            //used in for loop below to specify which element in the array should be appended
            var index: Int = 0
            
            
            
            //number of characters that the first (count/key) strings should take from input
            let toParseWithRemainder = (plaintext.count / Int(key)) + 1
            let toParseWithoutRemainder = plaintext.count / Int(key)
            
            //tracks how many characters are left to take from string
            var portionCounter: Int = 0
            
            for character in plaintext{
                
                //resets portionCounter when it reaches 0
                if (index <= (plaintext.count % Int(key)) - 1  && portionCounter == 0){
                    portionCounter = toParseWithRemainder
                } else if (index > (plaintext.count % Int(key)) - 1 && portionCounter==0){
                    portionCounter = toParseWithoutRemainder
                }
                
                //appends the string in the array with the character
                subStrings[index] = subStrings[index] + String(character)
                
                //decrements
                portionCounter -= 1
                if (portionCounter == 0){
                    index += 1
                }
                
            }
            
            //offset in row's string
            var offset: Int = 0
            //reuses index as a counter for which row string is being parsed
            index = 0
            
            for _ in 0 ... plaintext.count{
                //sets subString to the row's string
                let subString = subStrings[index]
                
                //if the offset is not larger than the string
                if (offset < subString.count){
                    //set the char to be the (offset)th character from the beginning of the string
                    let char: Character = subString[subString.index(subString.startIndex, offsetBy: offset)]
                    //append new character
                    decrypted = decrypted + String(char)
                }
                
                //calculate next index
                index = (index + 1) % Int(key)
                
                //if the index loops, observe next offset
                if(index == 0){
                    offset += 1
                }
                
            }
        } else {
            return "Secret must be greater than zero!"
        }
        return decrypted
    }
    
    
}
