//
//  OverloadedOps.swift
//  MayoNetworkLayer
//
//  Created by Sierra 2 on 09/08/17.
//  Copyright © 2017 Sierra 2. All rights reserved.
//

import SwiftyJSON
import UIKit

infix operator =>
infix operator =|
infix operator =<

typealias OptionalJSON = [String : JSON]?

func =>(key : ParamKeys, json : OptionalJSON) -> String?{
    return json?[key.rawValue]?.stringValue
}

func =<(key : ParamKeys, json : OptionalJSON) -> [String : JSON]?{
    return json?[key.rawValue]?.dictionaryValue
}

func =|(key : ParamKeys, json : OptionalJSON) -> [JSON]?{
    return json?[key.rawValue]?.arrayValue
}

prefix operator /

prefix func /(value: Int?) -> Int {
    return value ?? 0
}

prefix func /(value: [JSON]?) -> [JSON] {
    return value ?? []
}

prefix func /(value: [String]?) -> [String] {
    return value ?? []
}

prefix func /(value : String?) -> String {
    return value ?? ""
}

prefix func /(value : Float?) -> Float {
    return value ?? 0.0
}

prefix func /(value : Bool?) -> Bool {
    return value ?? false
}

prefix func /(value : CGFloat?) -> CGFloat {
    return value ?? 0.0
}

prefix func /(value : CGPoint?) -> CGPoint {
    return value ?? CGPoint()
}

prefix func /(value : IndexPath?) -> IndexPath {
    return value ?? IndexPath()
}
