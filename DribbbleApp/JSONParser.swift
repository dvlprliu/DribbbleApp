//
//  JSONParser.swift
//  DribbbleApp
//
//  Created by Zhuang Liu on 14/12/16.
//  Copyright (c) 2014年 LLL. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JsonParser {
  func parse(json: JSON)
}