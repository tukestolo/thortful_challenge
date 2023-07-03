//
//  MainViewModel.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

struct MainViewModel {

    private let getPopularMovies: GetPopularMovies

    init(getPopularMovies: GetPopularMovies = .init()) {
        self.getPopularMovies = getPopularMovies

        getMovies()
    }
}

private extension MainViewModel {

    func getMovies() {

        Task {
            let popularMovies = try await getPopularMovies.execute(forPage: 0)
            print(popularMovies)
        }
    }
}
