//
//  NSAttributedString+.swift
//  FloorplanBTests
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import Foundation
import UIKit
import XCTest

@testable import FloorplanB

class NSAttributedStringTests: XCTestCase {
  func testHeight() {
    let attributedString = NSAttributedString(
      string: "This is a test string",
      attributes: [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])

    XCTAssertEqual(attributedString.height(forWidth: 100, lineFragmentPadding: 0.0), 40.574, accuracy: 0.001)
  }

  func testWidth() {
    let attributedString = NSAttributedString(
      string: "This is a test string",
      attributes: [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])

    XCTAssertEqual(attributedString.width(forHeight: 100, lineFragmentPadding: 0.0), 144.093, accuracy: 0.001)
  }

  func testSizeGivenWidth() {
    let attributedString = NSAttributedString(
      string: "This is a test string",
      attributes: [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])

    XCTAssertEqual(attributedString.minimalSize(toFitWidth: 200, lineFragmentPadding: 0.0), CGSize(width: 144.09326171875, height: 20.287109375))
  }

  func testSizeGivenHeight() {
    let attributedString = NSAttributedString(
      string: "This is a test string",
      attributes: [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])

    XCTAssertEqual(attributedString.minimalSize(toFitHeight: 350, lineFragmentPadding: 0.0), CGSize(width: 144.09326171875, height: 20.287109375))
  }

  func testSizeFirstBaselineGivenWidth() {
    let attributedString = NSAttributedString(
      string: "This is a test string",
      attributes: [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])
    XCTAssertEqual(attributedString.firstBaseline(forWidth: 20, lineFragementPadding: 0.0), 17.186, accuracy: 0.001)
  }

  func testSizeFirstBaselineGivenHeight() {
    let attributedString = NSAttributedString(
      string: "This is a test string",
      attributes: [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])
    XCTAssertEqual(attributedString.firstBaseline(forHeight: 100, lineFragementPadding: 0.0), 17.186, accuracy: 0.001)
  }

  func testSizeLastBaselineGivenWidth() {
    let attributedString = NSAttributedString(
      string: "This is a test string",
      attributes: [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])
    XCTAssertEqual(attributedString.lastBaseline(forWidth: 20, lineFragementPadding: 0.0), 199.770, accuracy: 0.001)
  }

  func testSizeLastBaselineGivenHeight() {
    let attributedString = NSAttributedString(
      string: "This is a test string",
      attributes: [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)
    ])
    XCTAssertEqual(attributedString.lastBaseline(forHeight: 100, lineFragementPadding: 0.0), 17.186, accuracy: 0.001)
  }
}
