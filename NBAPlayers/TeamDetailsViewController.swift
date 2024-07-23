//
//  TeamDetailsViewController.swift
//  NBAPlayers
//
//  Created by Полина Голодаевская on 23.07.2024.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    
    var team: Team?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = team?.name
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
    }
}
