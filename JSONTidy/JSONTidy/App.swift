//
//  main.swift
//  JSONTidy
//
//  Created by Thomas Cowern on 5/20/23.
//
import ArgumentParser
import Foundation

@main
struct App: ParsableCommand {
    @Flag(name: .shortAndLong, help: "Neatly formats the output")
    var prettify = false

    @Flag(name: .shortAndLong, help: "Sort keys alphabetically.")
    var sort = false

    @Argument(help: "The filename you want to process.")
    var file: String
    
    func run() {
        print("Hello from Swift Argument Parser!")
    }
}

