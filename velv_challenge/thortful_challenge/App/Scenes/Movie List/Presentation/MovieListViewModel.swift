//
//  MovieListViewModel.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

class MovieListViewModel {

    var didReceivedMovies: (() -> Void)?

    private let getPopularMovies: GetPopularMovies
    private var popularMoviesList: [Movie] = []

    init(getPopularMovies: GetPopularMovies = .init()) {
        self.getPopularMovies = getPopularMovies

        getMoviesFor(page: 0)
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfItemsInSection(_ section: Int) -> Int {
        return popularMoviesList.count
    }

    func viewModelForRow(_ row: Int) -> MovieListCellViewModel? {
        guard let movie = popularMoviesList[safe: row] else { return nil }

        return .init(
            title: movie.title,
            posterPath: movie.posterPath
        )
    }
}

private extension MovieListViewModel {

    func getMoviesFor(page: Int) {

        Task {
            let popularMovies = try await getPopularMovies.execute(forPage: page)
            self.popularMoviesList.append(contentsOf: popularMovies.movies)
            self.didReceivedMovies?()
        }
    }
}
