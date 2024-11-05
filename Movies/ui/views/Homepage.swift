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

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        let m1 = Movie(movie_id: 1, title: "The Shawshank Redemption", studio: "ABC", thumbnail: "abc.jpg", critics_rating: 9.3)
        let m2 = Movie(movie_id: 2, title: "Bla bla", studio: "ACD", thumbnail: "abc.jpg", critics_rating: 9.2)
        movies.append(m1)
        movies.append(m2)
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
        cell.labelRating.text = "\(movie.critics_rating!)"
        cell.labelStudio.text = movie.studio
        if let url = URL(string: movie.thumbnail ?? "") {
            do {
                let data = try Data(contentsOf: url)
                cell.imageThumbnail.image = UIImage(data: data)
            } catch {
                print("Error loading image")
            }
        }
        return cell
    }
}
