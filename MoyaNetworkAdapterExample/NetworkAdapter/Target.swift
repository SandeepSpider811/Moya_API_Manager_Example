//
//  Target.swift
//  MayoNetworkLayer
//
//  Created by Sierra 2 on 08/08/17.
//  Copyright © 2017 Sierra 2. All rights reserved.
//

import Foundation
import Moya

enum Target {
    case login(loginBy: String?, emailPhone: String?, psw: String?)
    case accessTokenLogin(limit: Int?, skip: Int?)
    case editProfile(firstName: String?, lastName: String?, email: String?, phoneNo: String?, isFile: Bool?, profileImageUrl: UIImage?)
}

extension Target: TargetType, AccessTokenAuthorizable {
    
    public var baseURL: URL {
        return URL(string: APIConstants.basePath)!
    }
    
    var multipartBody: [MultipartFormData]? {
        switch self {
        case .editProfile(_, _, _, _, _, let img):
            guard let imageData: Data = UIImageJPEGRepresentation(img ?? UIImage(), 0.5) else { return nil }
            return [MultipartFormData(provider: .data(imageData), name: Keys.profileImage.rawValue, fileName: "photo.jpg", mimeType:"image/jpeg")]
        default:
            return nil
        }
    }
    
    public var path: String {
        switch self {
        case .login(_):
            return APIConstants.login
        case .accessTokenLogin(_):
            return APIConstants.accessTokenLogin
        case .editProfile(_):
            return APIConstants.editProfile
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login(_), .accessTokenLogin(_), .editProfile(_):
            return .put
        }
    }
    
    var parameters: [String : Any]? {
        let appVersion = "100"
        let deviceToken = "anonymous123"
        let deviceType = "0"
        let limit = "20"
        let skip = "0"
        let latitude = "38.563979"
        let longitude = "-122.872963"
        
        switch self {
        case .login(let loginBy, let emailPhone, let psw):
            return Parameters.login.map(values: [loginBy, emailPhone, psw, deviceType, deviceToken, appVersion, latitude, longitude, limit, skip])
        case .accessTokenLogin(let limit_, let skip_):
            return Parameters.accessTokenLogin.map(values: [deviceType, deviceToken, appVersion, latitude, longitude, String(describing: /limit_), String(describing: /skip_)])
        case .editProfile(let firstName, let lastName, let email, let phoneNo, let isFile, _):
            var dataToSend = Parameters.editProfile.map(values: [firstName, lastName, email, phoneNo, String(/isFile)])
            dataToSend?.removeValue(forKey: Keys.phoneNo.rawValue)
            return dataToSend
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .editProfile(_):
            return .upload(.multipart(multipartBody ?? []))
        default:
            return .request
        }
    }
    
    var validate: Bool {
        return true
    }
    
    var shouldAuthorize: Bool {
        //For Header API ? true : false
        switch self {
        case .accessTokenLogin(_), .editProfile(_):
            return true
        default:
            return false
        }
    }
}

