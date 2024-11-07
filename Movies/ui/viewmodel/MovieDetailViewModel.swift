//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Omer Cagri Sayir on 6.11.2024.
//

class MovieDetailViewModel {
    var mrepo = MoviesDAORepository()

    func update(movie_id: Int, title: String, rating: String, studio: String) {
        mrepo.update(movie_id: movie_id, title: title, rating: rating, studio: studio)
    }
}
