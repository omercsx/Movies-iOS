//
//  Movie.swift
//  Movies
//
//  Created by Omer Cagri Sayir on 5.11.2024.
//

class Movie {
    var movie_id: Int?
    var title: String?
    var studio: String?

    var rating: Double?

    init() {
    }

    init(movie_id: Int, title: String, studio: String, rating: Double) {
        self.movie_id = movie_id
        self.title = title
        self.studio = studio

        self.rating = rating
    }
}
