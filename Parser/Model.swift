//
//  Model.swift
//  Parser
//
//  Created by Zhanna Rolich on 21.11.2022.
//
import Foundation
import ObjectMapper


class AllNewsDetails: Mappable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
    
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        status <- map ["status"]
        totalResults <- map ["totalResults"]
        articles <- map ["articles"]
    }
}


class Article: Mappable {
    var title: String?
    var urlToImage : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map ["title"]
        urlToImage <- map ["urlToImage"]
    }
}


