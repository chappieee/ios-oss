@testable import Kickstarter_Framework
import XCTest

internal final class BackerDashboardViewControllerTests: TestCase {
  func testScrolToTop() {
    let vc = BackerDashboardViewController.instantiate()
    _ = vc.view

    let configureExpectation = expectation(description: "Waiting for view controllers to be configured")

    var pageViewController: UIPageViewController?

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      while pageViewController?.viewControllers?.first?.view as? UIScrollView == nil {
        pageViewController = vc.children
          .compactMap { $0 as? UIPageViewController }.first
      }
      configureExpectation.fulfill()
    }
    waitForExpectations(timeout: 10, handler: nil)

    XCTAssertNotNil(pageViewController?.viewControllers?.first?.view as? UIScrollView)
  }
}
