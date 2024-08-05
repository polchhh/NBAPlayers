//
//  Player.swift
//  NBAPlayers
//
//  Created by Полина Голодаевская on 22.07.2024.
//

import Foundation

struct PlayersResponse: Decodable {
    let data: [Player]
}

struct Player: Decodable {
    let firstName: String
    let lastName: String
    
    let team: Team

    let position: String
    
    var teamName: String {
        team.name
    }
    
    var height: String
    
    var FullName: String {
        firstName + " " + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case position = "position"
        case team = "team"
        case height = "height"
    }
}

let lakers = Team(name: "Lakers", city: "Los Angeles", conference: "West")
let heat = Team(name: "Heat", city: "Miami", conference: "East")
