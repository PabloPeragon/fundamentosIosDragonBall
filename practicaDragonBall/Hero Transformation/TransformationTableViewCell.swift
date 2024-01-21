//
//  TransformationTableViewCell.swift
//  practicaDragonBall
//
//  Created by Pablo Jesús Peragón Garrido on 19/1/24.
//

import UIKit

final class TransformationTableViewCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = "TransformationTableViewCell"
    // MARK: - Outlets
    @IBOutlet weak var tranformationImageView: UIImageView!
    @IBOutlet weak var tranformationNameLabel: UILabel!
    @IBOutlet weak var tranformationDescriptionText: UITextView!
    
    // MARK: - Configure
    func configure(with transformation: HeroTransformation) {
        tranformationNameLabel.text = transformation.name
        tranformationDescriptionText.text = transformation.description
        
        guard let imageURL = URL(string: transformation.photo ) else {
            return
        }
        tranformationImageView.setImage(url: imageURL)
        
    
    }
}

