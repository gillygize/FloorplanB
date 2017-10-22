//
//  ConstantIterator.swift
//  FloorplanB
//
//  Created by Matt on 10/22/17.
//  Copyright © 2017 Matt. All rights reserved.
//

import Foundation

struct ConstantIterator<Value>: IteratorProtocol {
  typealias Element = Value

  let value: Value

  init(value: Value) {
    self.value = value
  }

  mutating func next() -> Value? {
    return value
  }
}
