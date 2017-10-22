//
//  FrameableTests.swift
//  FloorplanBTests
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import XCTest

class FrameableTests: XCTestCase {
  func testWidth() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.width, 100)

    frameable.width = 200

    XCTAssertEqual(frameable.width, 200)
  }

  func testHeight() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.fpb.height, 100)

    frameable.height = 200

    XCTAssertEqual(frameable.fpb.height, 200)
  }

  func testTop() {
    var frameable: Frameable = CGRect(x: 0, y: 10, width: 100, height: 100)

    XCTAssertEqual(frameable.fpb.top, 10)

    frameable.top = 20

    XCTAssertEqual(frameable.fpb.top, 20)
  }

  func testBottom() {
    var frameable: Frameable = CGRect(x: 0, y: 10, width: 100, height: 100)

    XCTAssertEqual(frameable.fpb.bottom, 110)

    frameable.bottom = 90

    XCTAssertEqual(frameable.fpb.top, -10)
    XCTAssertEqual(frameable.fpb.bottom, 90)
  }

  func testLeft() {
    var frameable: Frameable = CGRect(x: 10, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.fpb.left, 10)

    frameable.left = 20

    XCTAssertEqual(frameable.fpb.left, 20)
  }

  func testRight() {
    var frameable: Frameable = CGRect(x: 10, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.fpb.right, 110)

    frameable.right = 90

    XCTAssertEqual(frameable.fpb.left, -10)
    XCTAssertEqual(frameable.fpb.right, 90)
  }

  func testTopLeftCorner() {
    var frameable: Frameable = CGRect(x: 10, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 10, y: 0))

    frameable.topLeftCorner = CGPoint(x: 20, y: 30)

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 20, y: 30))
  }

  func testTopRightCorner() {
    var frameable: Frameable = CGRect(x: 10, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.topRightCorner, CGPoint(x: 110, y: 0))

    frameable.topRightCorner = CGPoint(x: 200, y: 300)

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 100, y: 300))
    XCTAssertEqual(frameable.topRightCorner, CGPoint(x: 200, y: 300))
  }

  func testBottomLeftCorner() {
    var frameable: Frameable = CGRect(x: 10, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.bottomLeftCorner, CGPoint(x: 10, y: 100))

    frameable.bottomLeftCorner = CGPoint(x: 200, y: 300)

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 200, y: 200))
    XCTAssertEqual(frameable.bottomLeftCorner, CGPoint(x: 200, y: 300))
  }

  func testBottomRightCorner() {
    var frameable: Frameable = CGRect(x: 10, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.bottomRightCorner, CGPoint(x: 110, y: 100))

    frameable.bottomRightCorner = CGPoint(x: 200, y: 300)

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 100, y: 200))
    XCTAssertEqual(frameable.bottomRightCorner, CGPoint(x: 200, y: 300))
  }

  func testCenter() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.center, CGPoint(x: 50, y: 50))

    frameable.center = CGPoint(x: 100, y: 100)

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 50, y: 50))
    XCTAssertEqual(frameable.center, CGPoint(x: 100, y: 100))
  }

  func testCenterX() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.centerX, 50)

    frameable.centerX = 100

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 50, y: 0))
    XCTAssertEqual(frameable.centerX, 100)
  }

  func testCenterY() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.centerY, 50)

    frameable.centerY = 100

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 0, y: 50))
    XCTAssertEqual(frameable.centerY, 100)
  }

  func testSize() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.size, CGSize(width: 100, height: 100))

    frameable.size = CGSize(width: 50, height: 50)

    XCTAssertEqual(frameable.topLeftCorner, CGPoint(x: 0, y: 0))
    XCTAssertEqual(frameable.size, CGSize(width: 50, height: 50))
  }

  func testLeading() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.leading(forUserInterfaceDirection: .leftToRight), 0)
    XCTAssertEqual(frameable.leading(forUserInterfaceDirection: .rightToLeft), 100)

    frameable.set(leading: 100, forUserInterfaceDirection: .leftToRight)

    XCTAssertEqual(frameable.leading(forUserInterfaceDirection: .leftToRight), 100)
  }

  func testTrailing() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.trailing(forUserInterfaceDirection: .leftToRight), 100)
    XCTAssertEqual(frameable.trailing(forUserInterfaceDirection: .rightToLeft), 0)

    frameable.set(trailing: 100, forUserInterfaceDirection: .leftToRight)

    XCTAssertEqual(frameable.trailing(forUserInterfaceDirection: .leftToRight), 100)
  }

  func testResize() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.resize(withSize: CGSize(width: 50, height: 50)).frame, CGRect(x: 0, y: 0, width: 50, height: 50))
    XCTAssertEqual(frameable.resize(withWidth: 100).frame, CGRect(x: 0, y: 0, width: 100, height: 50))
    XCTAssertEqual(frameable.resize(withHeight: 100).frame, CGRect(x: 0, y: 0, width: 100, height: 100))
  }

  func testResizeToFitString() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)
    let attributeString = NSAttributedString(string: "Test String", attributes: [
      NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])

    XCTAssertEqual(frameable.resizeHeight(toFit: attributeString, lineFragmentPadding: 0.0).height, 20.287, accuracy: 0.01)
    XCTAssertEqual(frameable.resizeWidth(toFit: attributeString, lineFragmentPadding: 0.0).width, 82.269, accuracy: 0.01)
  }

  func testReposition() {
    var frameable: Frameable = CGRect(x: 0, y: 0, width: 100, height: 100)

    XCTAssertEqual(frameable.reposition(withTop: 100).frame, CGRect(x: 0, y: 100, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withBottom: 0).frame, CGRect(x: 0, y: -100, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withLeft: 100).frame, CGRect(x: 100, y: -100, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withRight: 0).frame, CGRect(x: -100, y: -100, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withTopLeftCorner: CGPoint(x: 0, y: 0)).frame, CGRect(x: 0, y: 0, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withTopRightCorner: CGPoint(x: 50, y: 50)).frame, CGRect(x: -50, y: 50, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withBottomLeftCorner: CGPoint(x: 100, y: 0)).frame, CGRect(x: 100, y: -100, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withBottomRightCorner: CGPoint(x: 100, y: 100)).frame, CGRect(x: 0, y: 0, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withCenter: CGPoint(x: 100, y: 100)).frame, CGRect(x: 50, y: 50, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withCenterX: 50).frame, CGRect(x: 0, y: 50, width: 100, height: 100))
    XCTAssertEqual(frameable.reposition(withCenterY: 50).frame, CGRect(x: 0, y: 0, width: 100, height: 100))
  }
}
