//
//  MovieTableViewCell.swift
//  IMDb client MVVM
//
//  Created by Антон Голубейков on 18.09.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    //MARK: - Views
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
}
