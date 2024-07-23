//
//  Player.swift
//  NBAPlayers
//
//  Created by Полина Голодаевская on 22.07.2024.
//

import Foundation

struct Player{
    let firstName: String
    let lastName: String
    
    var team: Team

    let position: String
    
    var teamName: String {
        team.name
    }
    
    let height: String
    
    var FullName: String {
        firstName + " " + lastName
    }
    
}
