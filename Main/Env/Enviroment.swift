//
//  Enviroments.swift
//  CleanApp
//
//  Created by Jonathan Carvalho Mendes on 16/11/21.
//

import Foundation

public final class Enviroment {
    public enum EnviromentsVariables: String {
        case apiBaseUrl = "API_BASE_URL"
    }
    public static func variable(_ key: EnviromentsVariables) -> String {
        return Bundle.main.infoDictionary![key.rawValue] as! String
    }
}
