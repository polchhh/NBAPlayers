//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by Полина Голодаевская on 22.07.2024.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let teams: [Team] = [Team(name: "Lakers", city: "Los Angeles", conference: "West"), Team(name: "Heat", city: "Miami", conference: "East")]
    
    var players: [Player] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        let player = players[indexPath.row]
        cell.textLabel?.text = player.FullName
        cell.detailTextLabel?.text = player.teamName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let playersDetailsViewController = storyboard.instantiateViewController(withIdentifier: "PlayersDetailsViewController") as! PlayersDetailsViewController
        let player = players[indexPath.row]
        playersDetailsViewController.player = player
        navigationController?.pushViewController(playersDetailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        players = [Player(firstName: "Joah", lastName: "Smit", team: teams[0], position: "SF", height: "6'88''"),
        Player(firstName: "Bob", lastName: "Stan", team: teams[1], position: "BG", height: "5'67''")]
    }
}
