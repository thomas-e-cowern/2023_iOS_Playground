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
        let url = URL(fileURLWithPath: file)

            guard let contents = try? Data(contentsOf: url) else {
                print("Failed to read input file \(file)")
                return
            }

            guard let json = try? JSONSerialization.jsonObject(with: contents, options: .fragmentsAllowed) else {
                print("Failed to parse JSON in input file \(file)")
                return
            }

            do {
                let newData = try JSONSerialization.data(withJSONObject: json)
                let outputString = String(decoding: newData, as: UTF8.self)
                print(outputString)
            } catch {
                print("Failed to create JSON output.")
            }
    }
}

