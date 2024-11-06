//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Omer Cagri Sayir on 5.11.2024.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var ratingTF: UITextField!
    @IBOutlet var studioTF: UITextField!

    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = movie {
            titleTF.text = m.title
            ratingTF.text = "\(m.critics_rating!)"
            studioTF.text = m.studio
        }
    }

    @IBAction func updateButton(_ sender: UIButton) {
        if let title = titleTF.text, let rating = ratingTF.text, let studio = studioTF.text, let m = movie {
            update(movie_id: m.movie_id!, title: title, rating: rating, studio: studio)
        }
    }

    func update(movie_id: Int, title: String, rating: String, studio: String) {
        print("Updating movie with id: \(movie_id) \nTitle: \(title) \nRating: \(rating) \nStudio: \(studio)")
    }
}
