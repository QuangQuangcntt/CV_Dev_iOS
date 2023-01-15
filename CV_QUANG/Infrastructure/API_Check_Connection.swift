//
//  API_Check_Connection.swift
//
//  Created by Quang Tran on 23/10/2021.
//
import Foundation
import SystemConfiguration
import Network
import Combine

// An enum to handle the network status
enum NetworkStatus: String {
    case connected
    case disconnected
    case none       //avoid duplicate check sestion time out at HOME
}

class Monitor_Internet: ObservableObject {
    @Published var status: NetworkStatus = .none    //default is disconnected
}


//MARK: - CHECK INTERNET CONNECTION FOR FUNCTION, NOT FOR UI

protocol Connectivity_protocol{
    func isConnectedToInternet() ->Bool
}

extension Connectivity_protocol {
    func isConnectedToInternet() ->Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)

        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }

        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        if flags.isEmpty {
            return false
        }

        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        return (isReachable && !needsConnection)
    }
}
