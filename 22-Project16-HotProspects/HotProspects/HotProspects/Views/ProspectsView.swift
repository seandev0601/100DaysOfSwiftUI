//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Po Hsiang Chao on 2023/11/3.
//

import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var showingSortSheet = false
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Unontacted people"
        }
    }
    
    var filterProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
                .sorted(by: prospects.sortField.sorted)
        case .contacted:
            return prospects.people
                .filter { $0.isContacted }
                .sorted(by: prospects.sortField.sorted)
        case .uncontacted:
            return prospects.people
                .filter { !$0.isContacted }
                .sorted(by: prospects.sortField.sorted)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        if filter == .none {
                            Image(systemName: prospect.isContacted ? "person.crop.circle.fill.badge.checkmark" :  "person.crop.circle.badge.xmark")
                                .foregroundColor(prospect.isContacted ? .green : .red)
                        }
                    }
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                            
                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    showingSortSheet = true
                } label: {
                    Label("Sort", systemImage: "line.3.horizontal.decrease.circle")
                }
                
                Button {
                    isShowingScanner = true
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            }
            .sheet(isPresented: $isShowingScanner, content: {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Cristin Hudson\ncristin@gmail.com", completion: handleScan)
            })
            .confirmationDialog("Sort by \(prospects.sortField.fieldName)", isPresented: $showingSortSheet, titleVisibility: .visible) {
                Button("Name") { prospects.sortField = .name }
                Button("Email") { prospects.sortField = .email }
                Button("Time") { prospects.sortField = .time }
            }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let detail = result.string.components(separatedBy: "\n")
            guard detail.count == 2 else { return }
            
            let person = Prospect()
            person.name = detail[0]
            person.emailAddress = detail[1]
            prospects.add(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = .default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        
                    } else {
                        print("\(error?.localizedDescription ?? "D' oh")")
                    }
                }
            }
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .environmentObject(Prospects())
}
