//
//  CamelSnaKebab.swift
//  CamelSnaKebab
//
//  Created by Anton Lebedev on 22.05.2022.
//
// This is the case-switching package's engine
// Package created as per Stewart Lynch's video: https://youtu.be/o0fQC7JU-Ts

@propertyWrapper
/// Description
/// - Parameters:
///  - inputString: the string, that needs to be converted to another case
///  - selectedCase: the final case, to which the string will be converted
 public struct CamelSnaKebab {

     //We receive the input string and the destination Case from user
     private var inputString: String
     private var selectedCase: SelectedCase
     
     //wrappedValue is requred to conform the @propertyWrapper protocol
     public var wrappedValue: String {
         get { glueWordsBackTogether(array: breakInputStringIntoWords()) }
         set { inputString = newValue }
     }
     
     public init(wrappedValue: String, selectedCase: SelectedCase) {
         self.inputString = wrappedValue
         self.selectedCase = selectedCase
     }

   
    
    /// To break the CamelCase into separate words (which will be later processed) we plainly make place a space between all capital letters
    //We receive a word (a small string) broken by
     private func addSpacesForCapitals() -> String {
         var newString: String = ""

         inputString.forEach { char in
             if char.isUppercase {
                 newString.append(" ")
             }
             newString.append(char)
         }
         //If there is already a space as a first letter of a word, we remove it, as we do not need two spaces
         if newString.first == " " {
             newString.removeFirst()
         }
         return newString
     }
    
    /// Breaks input string into words, using various separators, for example "_" for Snake case,
    ///"-" for Kebab case, and a space for CamelCase (because we have already applied
    ///addSpacesForCapital and if there are any capitals - there is a space in front of them
    ///The "split" is a special Xcode function
     private func breakInputStringIntoWords() -> [String] {
         let words: [String] = addSpacesForCapitals().split { separator in
             if separator == " " || separator == "-" || separator == "_" || separator == "+" || separator == "/" || separator == "'" { return true }
             return false
            
         //All words will be lowercased, to ease further processing
         }.map { String($0).lowercased() }

         return words
     }

    
    
    /// We combine separate processed word back together to form a new string
    /// For CamelCase we make the first letter capital
    /// For SnakeCase and KebabCase we add to "clear" word the "_" and "-" characters, respectively
     private func glueWordsBackTogether(array: [String]) -> String {
         var gluedString: String = ""

         switch selectedCase {
         //We break a word in two parts: the first letter (which we make capital), and the remaining trunc
         case .Camel:
             array.forEach { gluedString += $0.prefix(1).uppercased() + $0.dropFirst() }

         default:
             array.forEach { gluedString += $0 + selectedCase.rawValue }
             //We append the separator to each word, but for the very last word we don't need a separator, so we remove it
             if !gluedString.isEmpty { gluedString.removeLast() }
         }
         print(gluedString)
         return gluedString
     }
 }
