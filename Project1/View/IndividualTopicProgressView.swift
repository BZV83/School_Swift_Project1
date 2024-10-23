//
//  IndividualTopicProgress.swift
//  Project1
//
//  Created by Brendan Vick on 10/22/24.
//

import SwiftUI

struct IndividualTopicProgressView: View {
    
    var topic: String?
    
    var body: some View {
        Text("\(topic ?? "No Topic")")
    }
}
