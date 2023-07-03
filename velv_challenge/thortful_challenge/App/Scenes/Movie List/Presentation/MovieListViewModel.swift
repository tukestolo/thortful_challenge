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
    private var actualPage = 1
    private var isFetching = false

    init(getPopularMovies: GetPopularMovies = .init()) {
        self.getPopularMovies = getPopularMovies

        getMoviesFor(page: actualPage)
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
            posterURLString: movie.buildPosterURLString()
        )
    }

    func onEndListReached() {
        if !isFetching {
            isFetching = true
            actualPage += 1
            getMoviesFor(page: actualPage)
            isFetching = false
        }
    }

    func onRefreshControllPressed() {
        resetData()
        getMoviesFor(page: actualPage)
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

    func resetData() {
        actualPage = 0
        popularMoviesList = []
    }
}
