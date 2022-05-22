//
//  CaseSelector.swift
//  CamelSnaKebab
//
//  Created by Anton Lebedev on 22.05.2022.
//

import Foundation

//Set a divider to separate the words
//For CamelCase there is no divider
public enum SelectedCase: String {
    case Camel  = " "
    case Snake  = "_"
    case Kebab  = "-"
}
