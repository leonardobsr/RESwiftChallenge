//
//  Movie.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 19/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation

class Movie: Codable {
    
    var vote_count: Int?
    var id: Int?
    var video: Bool?
    var vote_average: Double?
    var title: String?
    var popularity: Double?
    var poster_path: String?
    var original_language: String?
    var original_title: String?
    var backdrop_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
}
