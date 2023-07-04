//
//  MovieListViewModelTests.swift
//  thortful_challengeTests
//
//  Created by Pedro Oliveira on 04/07/2023.
//

@testable import thortful_challenge
import XCTest

final class MovieListViewModelTests: XCTestCase {

    var sut: MovieListViewModel!
    var mockGetPopularMovies: MockGetPopularMovies!

    override func setUp() {
        super.setUp()
        mockGetPopularMovies = .init()
        sut = .init(getPopularMovies: mockGetPopularMovies, coordinator: MockCoordinator())
    }

    func test_numberOfSectionsIsCorrect_When_Init() {
        // Arrange
        mockGetPopularMovies.stubbedResult = .stub(
            page: 1,
            movies: [
                .stub(title: "some title 1"),
                .stub(title: "some title 2"),
                .stub(title: "some title 3"),
            ]
        )

        // Act
        sut = .init(
            getPopularMovies: mockGetPopularMovies,
            coordinator: MockCoordinator()
        )

        // Assert
        XCTAssertEqual(sut.numberOfSections(), 1)
    }

    func test_numberOfItemsInSectionIsCorrect_When_Init() async {
        // Arrange
        mockGetPopularMovies.stubbedResult = .stub(
            page: 1,
            movies: [
                .stub(title: "some title 1"),
                .stub(title: "some title 2"),
                .stub(title: "some title 3"),
            ]
        )

        // Act
        sut = .init(
            getPopularMovies: mockGetPopularMovies,
            coordinator: MockCoordinator()
        )

        do {
            try await Task.sleep(nanoseconds: UInt64(5 * Double(NSEC_PER_SEC)))
        } catch {}

        // Assert
        XCTAssertEqual(sut.numberOfItemsInSection(1), 3)
    }

    func test_CorrectViewModelForRowIsReturned_When_Call_ViewModelForRow() async {
        // Arrange
        mockGetPopularMovies.stubbedResult = .stub(
            page: 1,
            movies: [
                .stub(title: "some title 1"),
                .stub(title: "some title 2"),
                .stub(title: "some title 3"),
            ]
        )

        // Act
        sut = .init(
            getPopularMovies: mockGetPopularMovies,
            coordinator: MockCoordinator()
        )

        do {
            try await Task.sleep(nanoseconds: UInt64(5 * Double(NSEC_PER_SEC)))
        } catch {}

        let result = sut.viewModelForRow(1)

        // Assert
        XCTAssertEqual(result?.title, "some title 2")
    }
}
