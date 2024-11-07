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
    var viewModel = MovieDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = movie {
            titleTF.text = m.title
            ratingTF.text = "\(m.rating!)"
            studioTF.text = m.studio
        }
    }

    @IBAction func updateButton(_ sender: UIButton) {
        if let title = titleTF.text, let rating = ratingTF.text, let studio = studioTF.text, let m = movie {
            viewModel.update(movie_id: m.movie_id!, title: title, rating: rating, studio: studio)
        }
    }
}
