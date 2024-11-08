//
//  AddMovieViewController.swift
//  Movies
//
//  Created by Omer Cagri Sayir on 5.11.2024.
//

import UIKit

class AddMovieViewController: UIViewController {
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var ratingTF: UITextField!
    @IBOutlet var studioTF: UITextField!

    var viewModel = AddMovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonSave(_ sender: UIButton) {
        if let title = titleTF.text, let rating = ratingTF.text, let studio = studioTF.text {
            viewModel.save(title: title, rating: rating, studio: studio)
        }
        // Dismiss the view controller
        navigationController?.popViewController(animated: true)
    }
}
