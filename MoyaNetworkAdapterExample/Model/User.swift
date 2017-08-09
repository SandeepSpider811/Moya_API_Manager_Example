//
//  User.swift
//  MayoNetworkLayer
//
//  Created by Sierra 2 on 09/08/17.
//  Copyright © 2017 Sierra 2. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

class User: NSObject {
    var statusCode: String?
    var message: String?
    var userData: User_Data?
    
    override init() {
        super.init()
    }
    
    init(attributes: OptionalJSON) {
        super.init()
        message = .messageCode => attributes
        statusCode = .statusCode => attributes
        userData = User_Data(attributes: .data =< attributes)
    }
}

class User_Data: NSObject {
    var userDetails: UserDetails?
    var wineries: [Wineries]?
    var adminDefaults: AdminDefaults?
    var isForceUpdate: String?
    var isAnyUpdate: String?
    var updateMessage: String?
    var totalWineries: String?
    
    override init() {
        super.init()
    }
    
    init(attributes: OptionalJSON) {
        super.init()
        userDetails = UserDetails.init(attributes: .userDetails =< attributes)
        wineries = []
        (.wineries =| attributes)?.forEach({ (element) in
            self.wineries?.append(Wineries(attributes: element.dictionaryValue))
        })
        adminDefaults = AdminDefaults(attributes: .adminDefaults =< attributes)
        isForceUpdate = .isForceUpdate => attributes
        isAnyUpdate = .isAnyUpdate => attributes
        updateMessage = .updateMessage => attributes
        totalWineries = .totalWineries => attributes
    }
}

class Wineries: NSObject {
    var wineryName: String?
    var rating: String?
    var wineryShopNumber: String?
    var pinCode: String?
    var ratingCount: String?
    var _id: String?
    var streetName: String?
    var distanceCalculated: String?
    var city: String?
    var wineryType: String?
    var wineryPicURL: [PicURL]?
    var locationLongLat: Location?
    var isTopBarShown: String = "false"
    var wineryLogoPicURL: [PicURL]?
    
    override init() {
        super.init()
    }
    
    init(attributes: OptionalJSON) {
        super.init()
        wineryName = .wineryName => attributes
        rating = .rating => attributes
        wineryShopNumber = .wineryShopNumber => attributes
        pinCode = .pinCode => attributes
        ratingCount = .ratingCount => attributes
        _id = ._id => attributes
        streetName = .streetName => attributes
        distanceCalculated = .distanceCalculated => attributes
        city = .city => attributes
        wineryType = .wineryType => attributes
        wineryPicURL = []
        (.wineryPicURL =| attributes)?.forEach({ (element) in
            self.wineryPicURL?.append(PicURL(attributes: element.dictionaryValue))
        })
        wineryLogoPicURL = []
        (.wineryLogoPicURL =| attributes)?.forEach({ (element) in
            self.wineryLogoPicURL?.append(PicURL(attributes: element.dictionaryValue))
        })
        locationLongLat = Location(attributes: .locationLongLat =< attributes)
    }
    
    init(_ wineryName_: String?, _ address_: String?, _ rating_: String?, _ ratingCount_: String?, _ wineryLogo_: [PicURL]?, _ wineryID_: String?) {
        wineryName = wineryName_
        streetName = address_
        rating = rating_
        ratingCount = ratingCount_
        wineryLogoPicURL = wineryLogo_
        _id = wineryID_
    }
}

class UserDetails: NSObject {
    var firstName: String?
    var lastName: String?
    var email: String?
    var countryCode: String?
    var phoneNo: String?
    var timeOffset: String?
    var registeredBy: String?
    var registrationDate: String?
    var otp: String?
    var accessToken: String?
    var rating: String?
    var profilePicURL: PicURL?
    var _id: String?
    var accountState: String?
    var isVerified: String?
    var isInfoShare: String?
    var newTempPhoneNumber: String?
    
    override init() {
        super.init()
    }
    
    init(attributes: OptionalJSON) {
        super.init()
        firstName = .firstName => attributes
        lastName = .lastName => attributes
        email = .email => attributes
        countryCode = .countryCode => attributes
        phoneNo = .phoneNo => attributes
        timeOffset = .timeOffset => attributes
        registeredBy = .registeredBy => attributes
        registrationDate = .registrationDate => attributes
        otp = .otp => attributes
        accessToken = .accessToken => attributes
        rating = .rating => attributes
        profilePicURL = PicURL(attributes: .profilePicURL =< attributes)
        _id = ._id => attributes
        accountState = .accountState => attributes
        isVerified = .isVerified => attributes
        isInfoShare = .allowInfoSharedWithWinery => attributes
        newTempPhoneNumber = .newTempPhoneNumber => attributes
    }
    
    init(_ firstName_: String?, lastName_: String?, picURL_: PicURL?, id_: String?) {
        firstName = firstName_
        lastName = lastName_
        profilePicURL = picURL_
        _id = id_
    }
}

class AdminDefaults: NSObject {
    var twitterSharingText: String?
    var facebookSharingText: String?
    var wineryEduLink: String?
    var faqLink: String?
    var tastingExperienceCost: [String]?
    var facebookLink: String?
    var smsSharingText: String?
    var contactDetails: ContactDetails?
    var termsAndConditionLink: String?
    var twitterLink: String?
    var linkedinLink: String?
    var varietal: [String]?
    var wineryType: [String]?
    
    override init() {
        super.init()
    }
    
    init(attributes: OptionalJSON) {
        super.init()
        twitterSharingText = .twitterSharingText => attributes
        facebookSharingText = .facebookSharingText => attributes
        wineryEduLink = .wineryEduLink => attributes
        faqLink = .faqLink => attributes
        if let tastingCosts = attributes?[ParamKeys.tastingExperienceCost.rawValue]?.array {
            tastingExperienceCost = []
            for value in tastingCosts {
                tastingExperienceCost?.append(value.stringValue)
            }
        }
        facebookLink = .facebookLink => attributes
        smsSharingText = .smsSharingText => attributes
        contactDetails = ContactDetails(attributes: .contactDetails =< attributes)
        termsAndConditionLink = .termsAndConditionLink => attributes
        twitterLink = .twitterLink => attributes
        linkedinLink = .linkedinLink => attributes
        if let varietal_ = attributes?[ParamKeys.varietal.rawValue]?.array {
            varietal = []
            for value in varietal_ {
                varietal?.append(value.stringValue)
            }
        }
        if let winery_ = attributes?[ParamKeys.wineryType.rawValue]?.array {
            wineryType = []
            for value in winery_ {
                wineryType?.append(value.stringValue)
            }
        }
    }
}

class PicURL: NSObject {
    var _id: String?
    var original: String?
    var thumbnail: String?
    
    override init() {
        super.init()
    }
    
    init(attributes: OptionalJSON) {
        super.init()
        original = .original => attributes
        thumbnail = .thumbnail => attributes
        _id = ._id => attributes
    }
    
    init(_ original_: String?) {
        original = original_
    }
}

class ContactDetails: NSObject {
    var phoneNumber: String?
    var countryCode: String?
    var emailId: String?
    var websiteLink: String?
    
    override init() {
        super.init()
    }
    
    init(attributes: OptionalJSON) {
        super.init()
        phoneNumber = .phoneNo => attributes
        countryCode = .countryCode => attributes
        emailId = .emailId => attributes
        websiteLink = .websiteLink => attributes
    }
}

class Location: NSObject {
    var type: String?
    var coordinates: [String]?
    
    override init() {
        super.init()
    }
    
    init(attributes: OptionalJSON) {
        super.init()
        type = .type => attributes
        
        if let coords = attributes?[ParamKeys.coordinates.rawValue]?.array {
            coordinates = []
            for value in coords {
                coordinates?.append(value.stringValue)
            }
        }
    }
}
