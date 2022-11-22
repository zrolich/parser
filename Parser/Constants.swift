//
//  Constants.swift
//  Parser
//
//  Created by Zhanna Rolich on 21.11.2022.
//

import Foundation

let initialURL = "https://newsapi.org/v2/everything?q=education"
let apiKey = "6b1d1801cc724682b2340ed337884d3e"
let apiURL = initialURL + "&apiKey=" + apiKey


typealias GetComplete = () ->()
