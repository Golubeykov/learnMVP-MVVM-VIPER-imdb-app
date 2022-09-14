//
//  MoviesListViewController.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import UIKit

class MoviesListViewController: UIViewController, MoviesListPresenterOutput {
    //MARK: - Properties
    let presenter: MoviesListPresenter = MoviesListPresenter()
    let movieInListCell = "MovieTableViewCell"
    
    //MARK: - Views
    @IBOutlet weak var moviesListTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Methods
    func openMoviesListView(movie: Movie) {}
    func configureTableView() {
        moviesListTableView.dataSource = self
        moviesListTableView.register(UINib(nibName: movieInListCell, bundle: .main), forCellReuseIdentifier: movieInListCell)
    }
    func setPresenter() {
        presenter.setView(self)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        configureTableView()
    }
    
}
//MARK: - TableView data source
extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieInListCell, for: indexPath) as! MovieTableViewCell
        print(presenter.titleForMovieAt(indexPath.row))
        cell.movieImageView.image = presenter.imageForMovieAt(indexPath.row)
        cell.movieTitleLabel.text = presenter.titleForMovieAt(indexPath.row)
        cell.movieDescribtionLabel.text = presenter.descriptionForMovieAt(indexPath.row)
        return cell
    }
}
