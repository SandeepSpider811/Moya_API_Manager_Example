//
//  APIConstants.swift
//  MayoNetworkLayer
//
//  Created by Sierra 2 on 08/08/17.
//  Copyright © 2017 Sierra 2. All rights reserved.
//

import Foundation
import SwiftyJSON

internal struct APIConstants {
    static let basePath = "ANY_BASE_PATH" //Insert Your BasePath
    
    static let login = "api/user/login" //PUT
    static let accessTokenLogin = "api/user/accessTokenLogin" //PUT
    static let editProfile = "api/user/editProfile" //PUT
}

enum Keys : String {
    //Commmon login SignUp Keys
    case appVersion = "appVersion"
    case deviceToken = "deviceToken"
    case deviceType = "deviceType"
    
    case firstName = "firstName"
    case lastName = "lastName"
    case email = "email"
    case countryCode = "countryCode"
    case phoneNo = "phoneNumber"
    case psw = "password"
    case socialId = "socialId"
    case registeredBy = "registeredBy"
    case timeOffset = "timeOffSet"
    case isFile = "isFile"
    case profileImage = "profileImageUrl"
    case loginBy = "loginBy"
    case emailPhone = "emailPhoneNumber"
    case latitude = "latitude"
    case longitude = "longitude"
    case limit = "limit"
    case skip = "skip"
    case otp = "otp"
    case wineryID = "wineryId"
    case flag = "flag"
    case eventId = "eventId"
    case notes = "notes"
    case wishListId = "wishListId"
    case wishListName = "wishListName"
    case wines = "wines"
    case starRating = "starRating"
    case comment = "comment"
    case wineId = "wineId"
    case wineryName = "wineryName"
    case availabilityType = "availabilityType"
    case rating = "rating"
    case tastingFee = "tastingFee"
    case varietal = "varietal"
    case wineryType = "wineryType"
    case distance = "distance"
    case region = "region"
    case fav = "fav"
    case offerFlag = "offerFlag"
}


typealias OptionalDictionary = [String : Any]?

struct Parameters {
    static let login: [Keys] = [.loginBy, .emailPhone, .psw, .deviceType, .deviceToken, .appVersion, .latitude, .longitude, .limit, .skip]
    static let accessTokenLogin: [Keys] = [.deviceType, .deviceToken, .appVersion, .latitude, .longitude, .limit, .skip]
    static let editProfile: [Keys] = [.firstName, .lastName, .email, .phoneNo, .isFile]
}


