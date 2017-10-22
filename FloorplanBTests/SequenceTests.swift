//
//  SequenceTests.swift
//  FloorplanBTests
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import XCTest

class SequenceTests: XCTestCase {
  private func testArray(_ firstArray: AnySequence<Frameable>, _ secondArray: [Frameable]) {
    for (firstValue, secondValue) in zip(firstArray, secondArray) {
      XCTAssertEqual(firstValue.frame, secondValue.frame)
    }
  }

  func testMetrics() {
    let frameables: [Frameable] = [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ]

    XCTAssertEqual(frameables.sumOfHeights, 225)
    XCTAssertEqual(frameables.sumOfWidths, 175)
    XCTAssertEqual(frameables.minHeight, 50)
    XCTAssertEqual(frameables.maxHeight, 100)
    XCTAssertEqual(frameables.minWidth, 25)
    XCTAssertEqual(frameables.maxWidth, 100)
    XCTAssertEqual(frameables.minTop, 0)
    XCTAssertEqual(frameables.maxTop, 150)
    XCTAssertEqual(frameables.minBottom, 100)
    XCTAssertEqual(frameables.maxBottom, 225)
    XCTAssertEqual(frameables.minLeft, 0)
    XCTAssertEqual(frameables.maxLeft, 100)
    XCTAssertEqual(frameables.minRight, 75)
    XCTAssertEqual(frameables.maxRight, 150)
    XCTAssertEqual(frameables.minCenterX, 50)
    XCTAssertEqual(frameables.maxCenterX, 125)
    XCTAssertEqual(frameables.minCenterY, 50)
    XCTAssertEqual(frameables.maxCenterY, 187.5)
  }

  func testResize() {
    let frameables: [Frameable] = [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ]

    testArray(frameables.resize(withWidth: 100), [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 100, height: 50),
      CGRect(x: 50, y: 150, width: 100, height: 75),
    ])
    testArray(frameables.resize(withHeight: 200), [
      CGRect(x: 0, y: 0, width: 100, height: 200),
      CGRect(x: 100, y: 100, width: 50, height: 200),
      CGRect(x: 50, y: 150, width: 25, height: 200),
    ])
    testArray(frameables.resize(withSize: CGSize(width: 50, height: 50)), [
      CGRect(x: 0, y: 0, width: 50, height: 50),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 150, width: 50, height: 50),
    ])
  }

  func testReposition() {
    let frameables: [Frameable] = [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ]

    testArray(frameables.reposition(withTop: 100), [
      CGRect(x: 0, y: 100, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 100, width: 25, height: 75),
    ])
    testArray(frameables.reposition(withBottom: 200), [
      CGRect(x: 0, y: 100, width: 100, height: 100),
      CGRect(x: 100, y: 150, width: 50, height: 50),
      CGRect(x: 50, y: 125, width: 25, height: 75),
    ])
    testArray(frameables.reposition(withLeft: 200), [
      CGRect(x: 200, y: 0, width: 100, height: 100),
      CGRect(x: 200, y: 100, width: 50, height: 50),
      CGRect(x: 200, y: 150, width: 25, height: 75),
    ])
    testArray(frameables.reposition(withRight: 200), [
      CGRect(x: 100, y: 00, width: 100, height: 100),
      CGRect(x: 150, y: 100, width: 50, height: 50),
      CGRect(x: 175, y: 150, width: 25, height: 75),
    ])
    testArray(frameables.reposition(withTopLeftCorner: CGPoint(x: 100, y: 100)), [
      CGRect(x: 100, y: 100, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 100, y: 100, width: 25, height: 75),
    ])
    testArray(frameables.reposition(withTopRightCorner: CGPoint(x: 50, y: 50)), [
      CGRect(x: -50, y: 50, width: 100, height: 100),
      CGRect(x: 0, y: 50, width: 50, height: 50),
      CGRect(x: 25, y: 50, width: 25, height: 75),
    ])
    testArray(frameables.reposition(withBottomLeftCorner: CGPoint(x: 100, y: 100)), [
      CGRect(x: 100, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 50, width: 50, height: 50),
      CGRect(x: 100, y: 25, width: 25, height: 75),
    ])
    testArray(frameables.reposition(withBottomRightCorner: CGPoint(x: 150, y: 50)), [
      CGRect(x: 50, y: -50, width: 100, height: 100),
      CGRect(x: 100, y: 0, width: 50, height: 50),
      CGRect(x: 125, y: -25, width: 25, height: 75),
    ])
  }

  func testArrange() {
    let frameables: [Frameable] = [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ]

    testArray(frameables.arrangeTopToBottom(fromTop: 50), [
      CGRect(x: 0, y: 50, width: 100, height: 100),
      CGRect(x: 100, y: 150, width: 50, height: 50),
      CGRect(x: 50, y: 200, width: 25, height: 75),
    ])
    testArray(frameables.arrangeBottomToTop(fromBottom: 300), [
      CGRect(x: 0, y: 200, width: 100, height: 100),
      CGRect(x: 100, y: 150, width: 50, height: 50),
      CGRect(x: 50, y: 75, width: 25, height: 75),
    ])
    testArray(frameables.arrangeLeftToRight(fromLeft: 50), [
      CGRect(x: 50, y: 0, width: 100, height: 100),
      CGRect(x: 150, y: 100, width: 50, height: 50),
      CGRect(x: 200, y: 150, width: 25, height: 75),
    ])
    testArray(frameables.arrangeRightToLeft(fromRight: 250), [
      CGRect(x: 150, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 75, y: 150, width: 25, height: 75),
    ])
  }

  func testFit() {
    let viewToResize = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))

    _ = [
      UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)),
      viewToResize,
      UIView(frame: CGRect(x: 50, y: 150, width: 25, height: 75)),
    ].fitVertically(within: 1000, byResizing: viewToResize)
     .fitHorizonatally(within: 150, byResizing: viewToResize)

    XCTAssertEqual(viewToResize.frame, CGRect(x: 100, y: 100, width: 25, height: 825))
  }

  func testSpace() {
    let frameables: [Frameable] = [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ]

    testArray(frameables.space(with: []), [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ])
    testArray(frameables.space(with: [
      CGRect(x: 0, y: 0, width: 0, height: 50),
    ]), [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 0, y: 0, width: 0, height: 50),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ])
    testArray(frameables.space(with: [
      CGRect(x: 0, y: 0, width: 0, height: 50),
      CGRect(x: 0, y: 0, width: 0, height: 75),
    ]), [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 0, y: 0, width: 0, height: 50),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 0, y: 0, width: 0, height: 75),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ])
    testArray(frameables.space(with: [
      CGRect(x: 0, y: 0, width: 0, height: 50),
      CGRect(x: 0, y: 0, width: 0, height: 75),
      CGRect(x: 0, y: 0, width: 0, height: 25),
    ]), [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 0, y: 0, width: 0, height: 50),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 0, y: 0, width: 0, height: 75),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ])
    testArray(frameables.space(withHeight: 25), [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 0, y: 0, width: 0, height: 25),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 0, y: 0, width: 0, height: 25),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ])
    testArray(frameables.space(withWidth: 50), [
      CGRect(x: 0, y: 0, width: 100, height: 100),
      CGRect(x: 0, y: 0, width: 50, height: 0),
      CGRect(x: 100, y: 100, width: 50, height: 50),
      CGRect(x: 0, y: 0, width: 50, height: 0),
      CGRect(x: 50, y: 150, width: 25, height: 75),
    ])
  }
}
