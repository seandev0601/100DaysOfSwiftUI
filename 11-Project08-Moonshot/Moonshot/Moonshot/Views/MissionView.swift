//
//  MissionView.swift
//  Moonshot
//
//  Created by Po Hsiang Chao on 2023/8/2.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    @State private var animationEnable = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                        .rotation3DEffect(.degrees(animationEnable ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .animation(.linear(duration: 0.5), value: animationEnable)
                        .onTapGesture {
                            animationEnable.toggle()
                        }
                        .accessibilityHidden(true)
                    

                    VStack(alignment: .leading) {
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Launch Date")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.formattedLaunchDate)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)

                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AnstronautView(anstronaut: crewMember.astronaut)
                            } label: {
                                CrewMemberView(
                                    imageName: crewMember.astronaut.id,
                                    name: crewMember.astronaut.name,
                                    role: crewMember.role)
                            }
                            .accessibilityAddTraits(.isButton)
                        }
                    }
                }
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronaut: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronaut[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let mission: [Mission] = Bundle.main.decode("missions.json")
    static let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    static var previews: some View {
        MissionView(mission: mission[0], astronaut: astronaut)
            .preferredColorScheme(.dark)
    }
}
