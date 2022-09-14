//
//  DetailedInfoViewController.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import UIKit

class DetailedInfoViewController: UIViewController {
    //MARK: - Properties
    var movie: Movie? = nil
    
    //MARK: - Views
    @IBOutlet weak var detailedImage: UIImageView!
    @IBOutlet weak var detailedTitle: UILabel!
    @IBOutlet weak var detailedDescription: UILabel!
    
    //MARK: - Methods
    private func configureView() {
        detailedImage.image = movie?.image ?? UIImage()
        detailedTitle.text = movie?.name ?? ""
        detailedDescription.text = movie?.description ?? ""
    }
    private func configureNavigation() {
        navigationItem.title = "Detailed information"
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigation()
    }
}
