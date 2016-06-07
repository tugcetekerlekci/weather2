

//  Copyright © 2016 mApp. All rights reserved.
import Foundation

class Observable<T> {
  typealias Observer = T -> Void
  var observer: Observer?
  
  func observe(observer: Observer?) {
    self.observer = observer
    observer?(value)
  }
  
  var value: T {
    didSet {
      observer?(value)
    }
  }
  
  init(_ v: T) {
    value = v
  }
}
