//
//  MovieData.swift
//  KodMovies
//
//  Created by Saúl Pérez on 31/01/22.
//

import Foundation

struct MovieData: Decodable {
    let title : String
    let year : String
    let poster : String
    let duration : String
    let small_poster : String
    let description : String
}

struct ReviewData: Decodable {
    let  inLanguage : String
    let reviewBody : String
}

struct AgregateRatingData: Decodable {
    let ratingValue : Float
}
