//
//  AddMovieViewModel.swift
//  Movies
//
//  Created by Omer Cagri Sayir on 6.11.2024.
//

class AddMovieViewModel {
    var mrepo = MoviesDAORepository()
    func save(title: String, rating: String, studio: String) {
        mrepo.save(title: title, rating: rating, studio: studio)
    }
}
