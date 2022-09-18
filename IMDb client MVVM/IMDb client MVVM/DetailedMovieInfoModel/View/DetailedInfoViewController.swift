//
//  DetailedInfoViewController.swift
//  IMDb client MVVM
//
//  Created by Антон Голубейков on 18.09.2022.
//

import UIKit

class DetailedInfoViewController: UIViewController {
    //MARK: - Model
    var viewModel: DetailedInfoViewModelProtocol
    
    //MARK: - Views
    @IBOutlet weak var detailedImage: UIImageView!
    @IBOutlet weak var detailedTitle: UILabel!
    @IBOutlet weak var detailedDescription: UILabel!
    
    //MARK: - Methods
    init(viewModel: DetailedInfoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureView() {
        detailedImage.image = viewModel.setLogoForMovie()
        detailedTitle.text = viewModel.setTitleForMovie()
        detailedDescription.text = viewModel.setDescriptionForMovie()
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
