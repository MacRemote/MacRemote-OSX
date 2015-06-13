//
//  MRBonjourHandler.swift
//  MacRemote
//
//  Created by Tom Hu on 6/12/15.
//  Copyright (c) 2015 Tom Hu. All rights reserved.
//

import Cocoa

class MRBonjourHandler: NSObject, NSNetServiceDelegate {

    // MARK: NSNetServiceDelegate
    
    func netServiceWillPublish(sender: NSNetService) {
        println("Net Service Will Publish!")
    }
    
    func netServiceDidPublish(sender: NSNetService) {
        println("Net Service Did Publish!")
        println("Service Name: \(sender.name)")
        println("Port: \(sender.port)")
    }
    
    func netService(sender: NSNetService, didNotPublish errorDict: [NSObject : AnyObject]) {
        println("Net Service Did Not Publish!")
        println("Error: \(errorDict)")
    }
    
    func netServiceWillResolve(sender: NSNetService) {
        println("Net Service Will Resolve!")
    }
    
    func netServiceDidResolveAddress(sender: NSNetService) {
        println("Net Service Did Resolve Address!")
        println("Sender: \(sender)")
    }
    
    func netService(sender: NSNetService, didNotResolve errorDict: [NSObject : AnyObject]) {
        println("Net Service Did Not Resolve!")
        println("Error: \(errorDict)")
    }
    
    func netServiceDidStop(sender: NSNetService) {
        println("Net Service Did Stop!")
    }
    
    func netService(sender: NSNetService, didUpdateTXTRecordData data: NSData) {
        println("Net Service Did Update TXT Record Data!")
        println("Data: \(data)")
    }
    
    func netService(sender: NSNetService, didAcceptConnectionWithInputStream inputStream: NSInputStream, outputStream: NSOutputStream) {
        println("Net Service Did Accept Connection With Input Stream!")
        println("Input Stream: \(inputStream)")
        println("Output Stream: \(outputStream)")
    }
    
}
