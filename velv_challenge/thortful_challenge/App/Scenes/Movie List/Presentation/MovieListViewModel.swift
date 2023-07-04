//
//  MovieListViewModel.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

class MovieListViewModel {

    let title = L10n.moviesListTitleViewController
    var didReceivedMovies: (() -> Void)?

    private let getPopularMovies: GetPopularMovies
    private var popularMoviesList: [Movie] = []
    private var actualPage = 1
    private var isFetching = false

    private weak var coordinator: Coordinator?

    init(
        getPopularMovies: GetPopularMovies = .init(),
        coordinator: Coordinator
    ) {
        self.getPopularMovies = getPopularMovies
        self.coordinator = coordinator

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

    func onDidSelectItemAt(row: Int) {
        guard let coordinator else { return }

        coordinator.goToMovieDetail(movie: popularMoviesList[row])
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
