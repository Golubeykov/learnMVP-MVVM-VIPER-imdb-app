//
//  MoviesListViewController.swift
//  IMDb client MVVM
//
//  Created by Антон Голубейков on 18.09.2022.
//

import UIKit

class MoviesListViewController: UIViewController {
    //MARK: - Properties
    private let movieInListCell = "MovieTableViewCell"
    private let viewModel: MoviesListViewModelProtocol = MoviesListViewModel()
    private var movies: [Movie] = []
    
    //MARK: - Views
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesListTableView: UITableView!
    let activityIndicator = UIActivityIndicatorView()

    
    //MARK: - Methods
    private func bindViewModel() {
        viewModel.moviesLoadedSignal.bind { [weak self] movies in
            self?.movies = movies
            self?.activityIndicator.stopAnimating()
            self?.moviesListTableView.isUserInteractionEnabled = true
            self?.moviesListTableView.reloadData()
        }
        viewModel.moviesLoadErrorSignal.bind { [weak self] resultError in
            guard let `self` = self else { return }
            self.activityIndicator.stopAnimating()
            self.moviesListTableView.isUserInteractionEnabled = true
            appendAlertView(for: self, text: "\(resultError.self ?? Errors.unknownError)", completion: { _ in })
        }
        viewModel.openMovieSignal.bind { [weak self] movie in
            if let movie = movie {
                self?.openMovieDetailedInfo(movie: movie)
            }
        }
    }
    private func configureActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.stopAnimating()
    }
    private func configureTableView() {
        moviesListTableView.dataSource = self
        moviesListTableView.delegate = self
        moviesListTableView.register(UINib(nibName: movieInListCell, bundle: .main), forCellReuseIdentifier: movieInListCell)
    }
    private func configureSearchBar() {
        searchBar.delegate = self
    }
    private func configureNavigationBar() {
        navigationItem.title = "Find a movie by title"
    }
    private func openMovieDetailedInfo(movie: Movie) {
        let viewModel = DetailedInfoViewModel(movie: movie)
        let viewController = DetailedInfoViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        configureTableView()
        configureSearchBar()
        configureActivityIndicator()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
}

//MARK: - TableView data source, delegate
extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieInListCell, for: indexPath) as! MovieTableViewCell
        cell.movieImageView.image = movies[indexPath.row].image
        cell.movieTitleLabel.text = movies[indexPath.row].name
        cell.movieDescriptionLabel.text = movies[indexPath.row].description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectMovieAt(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Searchbar delegate
extension MoviesListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        searchBar.endEditing(true)
        activityIndicator.startAnimating()
        moviesListTableView.isUserInteractionEnabled = false
        viewModel.getMovies(name: searchText)
    }
}
