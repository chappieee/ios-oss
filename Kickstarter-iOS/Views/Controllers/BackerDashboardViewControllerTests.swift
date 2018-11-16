@testable import Kickstarter_Framework
import XCTest

internal final class BackerDashboardViewControllerTests: TestCase {
  func testScrolToTop() {
    let vc = BackerDashboardViewController.instantiate()
    _ = vc.view

    let configureExpectation = expectation(description: "Waiting for view controllers to be configured")

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      configureExpectation.fulfill()
    }

    waitForExpectations(timeout: 5, handler: nil)

    let pageViewController = vc.children
      .compactMap { $0 as? UIPageViewController }.first

    XCTAssertNotNil(pageViewController?.viewControllers?.first?.view as? UIScrollView)
  }
}
