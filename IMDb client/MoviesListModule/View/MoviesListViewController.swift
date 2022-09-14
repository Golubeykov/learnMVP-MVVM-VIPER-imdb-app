//
//  MoviesListViewController.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import UIKit

class MoviesListViewController: UIViewController, MoviesListPresenterOutput {
    //MARK: - Properties
    private let presenter: MoviesListPresenter = MoviesListPresenter()
    private let movieInListCell = "MovieTableViewCell"
    
    //MARK: - Views
    @IBOutlet private weak var moviesListTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    //MARK: - Methods
    func openMoviesListView(movie: Movie) {}
    private func configureTableView() {
        moviesListTableView.dataSource = self
        moviesListTableView.register(UINib(nibName: movieInListCell, bundle: .main), forCellReuseIdentifier: movieInListCell)
    }
    private func configureSearchBar() {
        searchBar.delegate = self
    }
    private func configureNavigationBar() {
        navigationItem.title = "Find a movie by title"
    }
    private func setPresenter() {
        presenter.setView(self)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        configureSearchBar()
        configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
}
//MARK: - TableView data source
extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieInListCell, for: indexPath) as! MovieTableViewCell
        cell.movieImageView.image = presenter.imageForMovieAt(indexPath.row)
        cell.movieTitleLabel.text = presenter.titleForMovieAt(indexPath.row)
        cell.movieDescribtionLabel.text = presenter.descriptionForMovieAt(indexPath.row)
        return cell
    }
}

//MARK: - Searchbar delegate
extension MoviesListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let dispatchGroup = DispatchGroup()
        
        searchBar.endEditing(true)
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        moviesListTableView.isUserInteractionEnabled = false
        dispatchGroup.enter()
        presenter.getMovies(name: searchBar.text) {
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: DispatchQueue.main) {
            activityIndicator.stopAnimating()
            self.moviesListTableView.reloadData()
            self.moviesListTableView.isUserInteractionEnabled = true
        }
    }
}
