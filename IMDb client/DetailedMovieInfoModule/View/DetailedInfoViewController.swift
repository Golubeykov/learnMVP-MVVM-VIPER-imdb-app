//
//  DetailedInfoViewController.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import UIKit

class DetailedInfoViewController: UIViewController, MovieDetailedInfoPresenterOutput {
    //MARK: - Properties
    var presenter: MoviesDetailedInfoPresenter
    
    //MARK: - Views
    @IBOutlet weak var detailedImage: UIImageView!
    @IBOutlet weak var detailedTitle: UILabel!
    @IBOutlet weak var detailedDescription: UILabel!
    
    //MARK: - Methods
    init(presenter: MoviesDetailedInfoPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setPresenter() {
        presenter.setView(self)
    }
    private func configureView() {
        detailedImage.image = presenter.setLogoForMovie()
        detailedTitle.text = presenter.setTitleForMovie()
        detailedDescription.text = presenter.setDescriptionForMovie()
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
