

//  Copyright © 2016 mApp. All rights reserved.
import Foundation

struct Error {
  enum Code: Int {
    case URLError                 = -6000
    case NetworkRequestFailed     = -6001
    case JSONSerializationFailed  = -6002
    case JSONParsingFailed        = -6003
  }
  
  let errorCode: Code
}