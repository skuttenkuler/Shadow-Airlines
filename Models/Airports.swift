//
//  Data.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/12/21.
//

import Foundation

struct States: Codable {
    let id: Int
    let state: String
    let cities: [Cities]
}
struct Cities : Codable {
    let id: Int
    let city: String
    let code: String
}
