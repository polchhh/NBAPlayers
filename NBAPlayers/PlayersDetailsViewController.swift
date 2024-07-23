//
//  PlayersDetailsViewController.swift
//  NBAPlayers
//
//  Created by Полина Голодаевская on 22.07.2024.
//

import UIKit

class PlayersDetailsViewController: UIViewController {
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    
    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = player?.FullName
        positionLabel.text = player?.position
        heightLabel.text = player?.height
        teamButton.setTitle(player?.teamName, for: .normal)
    }
    
    @IBAction func onTeamButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamDetailsViewController = storyboard.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
        let team = player?.team
        teamDetailsViewController.team = team
        navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }

}
