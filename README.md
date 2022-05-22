# CamelSnaKebabPackage

 ### Property Wrapper @CamelSnaKebabPackage
 ## 
 A tool to convert some convert wrapped string into CamelCase, SnakeCase or kebabCase, using as dividers the capital letters and the symbols "-",  "_", "+", "'", "\" 

  ## Table of Contents
  * [Getting Started](#getting-started)
  * [Usage](#usage)
      * [Basic Examples](#usage)

  ## Getting Started
  CamelSnaKebabPackage is a *swift package*.
   * Import it to your project by using the Swift Packages option, located within the File menu.
   * When asked, use this repository's url: https://github.com/mpopsicle235111/CamelSnaKebabPackage.git

   ## Usage

  ### Basic example:
  ```swift
  import SwiftUI
  import CamelSnaKebabPackage

  struct ContentView: View {
      @CamelSnaKebab(selectedCase: .Camel) var Line1 = "Sometimes+you wonder if this fight is worthwhile"
      @CamelSnaKebab(selectedCase: .Kebab) var Line2 = "Sometimes+you wonder if this fight is worthwhile"
      @CamelSnaKebab(selectedCase: .Kebab) var Line3 = "ThosePreciousMomentsAre/All LOST in_the_tide"
      @CamelSnaKebab(selectedCase: .Snake) var Line4 = "They're swept away and-nothing-is-what-it-seems"
      
     
      var body: some View {
          
          ZStack {
              Image("background1")
                  .resizable()   
              
                  VStack {
                      Text(Line1)
                      Text(Line2)
                          .padding()
                      Text(Line3)
                          .font(.system(.headline, design: .rounded))
                          .foregroundColor(.white)
                          .shadow(radius: 10.0)
                          .padding()
                      Text(Line4)
                          .font(.system(.largeTitle, design: .rounded))
                          .foregroundColor(.white)
                          .shadow(radius: 10.0)
                          .padding()
                  }
          }
      }
  }

  struct ContentView_Previews: PreviewProvider {
      static var previews: some View {
          ContentView()
      }
  }
