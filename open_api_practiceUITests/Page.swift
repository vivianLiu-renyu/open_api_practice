import XCTest

enum ElementStatus: String {
    case exist = "exists == true"
    case hittable = "isHittable == true"
}

class Page {
    var app: XCUIApplication
    
    required init(_ app: XCUIApplication) {
        self.app = app
    }
    
    func on<T: Page>(view: T.Type) -> T {
        return view.init(app)
    }
}

class TestBuilder {
    var app: XCUIApplication
    
    init(_ app: XCUIApplication) {
        self.app = app
    }
    
    func launch() -> Page {
        app.launch()
        
        return Page.init(app)
    }
}

func expect(element: XCUIElement, status: ElementStatus) {
    let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: status.rawValue), object: element)
    let result = XCTWaiter().wait(for: [expectation], timeout: 10)
    
    if result == .timedOut {
        XCTFail(expectation.description)
    }
}

func tap(element: XCUIElement) {
    expect(element: element, status: .exist)
    element.tap()
}
