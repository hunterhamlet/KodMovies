//
//  PeliculaModel.swift
//  KodMovies
//
//  Created by Saúl Pérez on 31/01/22.
//

import Foundation

struct MovieModel{
    let title : String
    let year : String
    let poster : String
    let duration : String
    let small_poster : String
    let description : String
}

struct review{
    let  inLanguage : String
    let reviewBody : String
}

struct agregateRating {
    let ratingValue : Float
}
