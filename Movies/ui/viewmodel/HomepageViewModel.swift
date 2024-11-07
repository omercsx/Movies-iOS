//
//  HomepageViewModel.swift
//  Movies
//
//  Created by Omer Cagri Sayir on 6.11.2024.
//
import RxSwift

class HomepageViewModel {
    var mrepo = MoviesDAORepository()
    var moviesList = BehaviorSubject<[Movie]>(value: [Movie]())

    init() {
        copyDatabase()
        moviesList = mrepo.moviesList
        getMovies()
    }

    func delete(movie_id: Int) {
        mrepo.delete(movie_id: movie_id)
    }

    func getMovies() {
        mrepo.getMovies()
    }

    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "movies", ofType: ".sqlite")
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destPath).appendingPathComponent("movies.sqlite").path
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: copyPath) {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath)
            } catch {
                print("Error copying database: \(error.localizedDescription)")
            }
        }
    }
}
