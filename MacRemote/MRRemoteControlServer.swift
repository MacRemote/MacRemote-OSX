//
//  MRRemoteControlServer.swift
//  MacRemote
//
//  Created by Tom Hu on 6/13/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa
import AppKit
import CocoaAsyncSocket

enum PacketTag: Int {
    case Header = 1
    case Body = 2
}

class MRRemoteControlServer: NSObject, GCDAsyncSocketDelegate {
    
    class var sharedServer: MRRemoteControlServer {
        struct Static {
            static let server: MRRemoteControlServer = MRRemoteControlServer()
        }
        return Static.server
    }
    
    private var service: NSNetService!
    private var socket: GCDAsyncSocket!
    
    private lazy var bounjourHandler: MRBonjourHandler! = MRBonjourHandler()
    
    // MARK: - Life Circle
    override init() {
        super.init()
    }
    
    func startBroadCasting() {
        self.socket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        
        var error: NSError?
        if self.socket.acceptOnPort(0, error: &error) {
            self.service = NSNetService(domain: "local.", type: "_macremote._tcp.", name: NSHost.currentHost().name!, port: Int32(self.socket.localPort))
            self.service.delegate = self.bounjourHandler
            self.service.publish()
        } else {
            println("Unable to create socket. Error \(error)")
        }
    }
    
    private func parseHeader(data: NSData) -> UInt {
        var out: UInt = 0
        data.getBytes(&out, length: sizeof(UInt))
        return out
    }
    
    // MARK: - GCDAsyncSocketDelegate
    
    func socket(sock: GCDAsyncSocket!, didAcceptNewSocket newSocket: GCDAsyncSocket!) {
        println("Accepted new socket")
        self.socket = newSocket
        self.socket.readDataToLength(UInt(sizeof(UInt)), withTimeout: -1.0, tag: PacketTag.Header.rawValue)
    }
    
    func socketDidDisconnect(sock: GCDAsyncSocket!, withError err: NSError!) {
        println("Disconnected: error \(err)")
    }
    
    func socket(sock: GCDAsyncSocket!, didReadData data: NSData!, withTag tag: Int) {
        println("Read data")
        
        if data.length == sizeof(UInt) {
            // Header
            let bodyLength: UInt = self.parseHeader(data)
            sock.readDataToLength(bodyLength, withTimeout: -1, tag: PacketTag.Body.rawValue)
        } else {
            // Body
            if let body = NSString(data: data, encoding: NSUTF8StringEncoding) {
                println("Body: \(body)")
                
                // Handle ios notification
                
            }
            
            sock.readDataToLength(UInt(sizeof(UInt)), withTimeout: -1, tag: PacketTag.Header.rawValue)
        }
    }
    
    func socket(sock: GCDAsyncSocket!, didWriteDataWithTag tag: Int) {
        println("Wrote data with tag: \(tag)")
    }
    
}
