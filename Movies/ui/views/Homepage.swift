//
//  ViewController.swift
//  Movies
//
//  Created by Omer Cagri Sayir on 5.11.2024.
//

import UIKit

class Homepage: UIViewController {
    @IBOutlet var moviesTableView: UITableView!
    var movies: [Movie] = []
    var viewModel = HomepageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self

        _ = viewModel.moviesList.subscribe(onNext: { movies in
            self.movies = movies
            self.moviesTableView.reloadData()
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.getMovies()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let movie = sender as? Movie {
                let vc = segue.destination as! MovieDetailViewController
                vc.movie = movie
            }
        }
    }
}

extension Homepage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        cell.labelTitle.text = movie.title
        cell.labelRating.text = "\(movie.rating!)"
        cell.labelStudio.text = movie.studio

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: movie)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            let movie = self.movies[indexPath.row]
            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete \(movie.title ?? "No title")", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)

            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
                self.viewModel.delete(movie_id: movie.movie_id!)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true, completion: nil)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
