//
//  HeroeTableViewCell.swift
//  practicaDragonBall
//
//  Created by Pablo Jesús Peragón Garrido on 18/1/24.
//

import UIKit

final class HeroeTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var heroeImageView: UIImageView!
    @IBOutlet weak var heroeNameLabel: UILabel!
    
    // MARK: - Configure
    func configure(with heroe: DragonBallHero) {
        heroeNameLabel.text = heroe.name
        
        guard let imageURL = URL(string: heroe.photo) else {
            return
        }
        heroeImageView.setImage(url: imageURL)    }

}
