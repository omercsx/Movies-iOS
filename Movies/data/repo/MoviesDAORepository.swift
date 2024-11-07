//
//  MoviesDAORepository.swift
//  Movies
//
//  Created by Omer Cagri Sayir on 6.11.2024.
//
import RxSwift

class MoviesDAORepository {
    var moviesList = BehaviorSubject<[Movie]>(value: [Movie]())

    let db: FMDatabase?

    init() {
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: destPath).appendingPathComponent("movies.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }

    func save(title: String, rating: String, studio: String) {
        db?.open()

        do {
            try db?.executeUpdate("INSERT INTO movies (title, rating, studio) VALUES (?, ?, ?)", values: [title, rating, studio])

        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }

    func update(movie_id: Int, title: String, rating: String, studio: String) {
        db?.open()

        do {
            try db?.executeUpdate("UPDATE movies SET title = ?, rating = ?, studio = ? WHERE movie_id = ?", values: [title, rating, studio, movie_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }

    func delete(movie_id: Int) {
        db?.open()
        do {
            try db?.executeUpdate("DELETE FROM movies WHERE movie_id = ?", values: [movie_id])
            getMovies()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }

    func getMovies() {
        db?.open()
        var movies = [Movie]()
        do {
            let rs = try db?.executeQuery("SELECT * FROM movies", values: nil)
            while (rs?.next())! {
                let movie_id = Int(rs?.int(forColumn: "movie_id") ?? 0)
                let title = rs?.string(forColumn: "title") ?? ""
                let studio = rs?.string(forColumn: "studio") ?? ""
                let rating = rs?.double(forColumn: "rating") ?? 0.0
                movies.append(Movie(movie_id: movie_id, title: title, studio: studio, rating: rating))
            }
            moviesList.onNext(movies)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
