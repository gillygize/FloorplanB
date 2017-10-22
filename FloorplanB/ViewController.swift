//
//  ViewController.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  lazy var firstView: UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = .red
    return view
  }()

  lazy var secondView: UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = .blue
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(firstView)
    view.addSubview(secondView)

    layout()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    layout()
  }

  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    layout()
  }

  func layout() {
    [
      firstView,
      secondView
    ].resize(withSize: CGSize(width: view.bounds.size.width - 20, height: 100))
     .reposition(withTopLeftCorner: CGPoint(x: view.safeAreaInsets.left + 10, y: view.safeAreaInsets.top))
     .space(withHeight: 10)
     .arrangeTopToBottom(fromTop: 0)
     .toArray()
  }
}
