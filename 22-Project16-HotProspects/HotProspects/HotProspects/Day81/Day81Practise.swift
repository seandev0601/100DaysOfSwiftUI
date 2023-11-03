//
//  Day81Practise.swift
//  HotProspects
//
//  Created by Po Hsiang Chao on 2023/11/3.
//

import SwiftUI
import UserNotifications
import SamplePackage

struct Day81Practise: View {
    let possibleNumbers = Array(1...60)
    @State private var lotteryTickets:[String] = []
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ticketList
                addButton
            }
            .navigationTitle("Lottery")
            .onAppear {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("Permission granted!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

extension Day81Practise {
    func generateLotteryNumbers() {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        let ticket = strings.joined(separator: ", ")
        
        lotteryTickets.append(ticket)
    }
    
    func deleteTicket(_ ticket: String) {
        if let offset = lotteryTickets.firstIndex(of: ticket) {
            lotteryTickets.remove(at: offset)
        }
    }
    
    func win(_ ticket: String) {
        if let offset = lotteryTickets.firstIndex(of: ticket) {
            let result = ticket + " (win)❤️"
            lotteryTickets[offset] = result
            notification(result: "Congratulations on winning.", ticket: result)
        }
    }
    
    func lost(_ ticket: String) {
        if let offset = lotteryTickets.firstIndex(of: ticket) {
            let result = ticket + " (lost)❎"
            lotteryTickets[offset] = result
            notification(result: "Please come again.", ticket: result)
        }
    }
    
    func notification(result: String, ticket: String) {
        let content = UNMutableNotificationContent()
        content.title = "Lottery result"
        content.subtitle = result
        content.body = ticket
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

extension Day81Practise {
    
    var ticketList: some View {
        List {
            ForEach(lotteryTickets, id:\.self) { ticket in
                Text(ticket)
                    .swipeActions {
                        Button(role: .destructive) {
                            deleteTicket(ticket)
                        } label: {
                            Label("Delete", systemImage: "minus.circle")
                        }
                    }
                    .contextMenu {
                        Button("win") {
                            win(ticket)
                        }
                        Button("lost") {
                            lost(ticket)
                        }
                    }
            }
        }
    }
    
    var addButton: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    generateLotteryNumbers()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
            }
        }
        .padding()
    }
}


#Preview {
    Day81Practise()
}
