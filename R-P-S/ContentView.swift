//
//  ContentView.swift
//  R-P-S
//
//  Created by Parth Antala on 2024-07-06.
//

import SwiftUI
enum Movement: String, CaseIterable, Identifiable {
    case rock = "hand.thumbsup.fill"
    case paper = "hand.raised.fill"
    case scissor = "scissors"
    var id: String { self.rawValue }
    
}

enum Result: String, CaseIterable, Identifiable {
    case win = "WINNER"
    case loss = "LOSER"
    case draw = "IT'S A DRAW"
    
    var id: String { self.rawValue }
}
struct ContentView: View {
    
    var movements: [Movement] = Movement.allCases
    @State private var selectedMovement: Movement?
    @State private var userSelectedMovement: Movement?
    @State private var gessing: Bool = false
    @State private var currentIndex = 0
    @State private var result: Result? = nil
    @State private var initial: Bool = true
    
    private let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            
            
            
            
           
            
            if !gessing && !initial {
                
                let result = checkResult(random: selectedMovement ?? .paper, user: userSelectedMovement ?? Movement.paper)
               Text(result.rawValue)
                    .padding(.top)
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(result == Result.loss ? .red : .green)
                    .animation(.easeInOut)
            } else {
                Text("Let's Bettle")
                    .padding(.top)
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(.cyan)
                    .animation(.easeInOut)
            }
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.cyan.opacity(0.3))
                    .frame(width: 350, height: 350)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: movements[currentIndex].rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .transition(.opacity)
                            .foregroundColor(.cyan)
                    )
            }
            .onReceive(timer) { _ in
                if gessing {
                    withAnimation {
                        currentIndex = (currentIndex + 1) % movements.count
                        selectedMovement = movements[currentIndex]
                    }
                }
            }
            
            Spacer()
            HStack {
                Button("ROCK") {
                    userSelectedMovement = Movement.rock
                    gessing.toggle()
                }
                Button("PAPER") {
                    userSelectedMovement = Movement.paper
                    gessing.toggle()
                }
                Button("SCISSOR") {
                    userSelectedMovement = Movement.scissor
                    gessing.toggle()
                }
            }
            .buttonStyle()
            Spacer()
            Button(action: {
                            gessing = true
                initial = false
                        }) {
                            Text("Start")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green.opacity(0.4))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.green.opacity(0.4))
                        .padding()
            
           
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MeshGradient(width: 3, height: 3, points: [
                [0, 0], [0.5, 0], [1, 0],
                [0, 0.5], [0.5, 0.5], [1, 0.5],
                [0, 1], [0.5, 1], [1, 1]
            ], colors: [
                .white, .white, .white,
                .white, .white, .cyan,
                .cyan, .cyan, .cyan
            ])
            .ignoresSafeArea()
        )
    }
}

func checkResult(random: Movement, user: Movement) -> Result {
    
    if(random == user) {
        return .draw
    }
    
    switch random {
    case .rock:
        if(user == .scissor) {
            return user == .scissor ? .loss : .win
        } else {
            return user == .paper ? .win : .loss
        }
    case .paper:
        if(user == .scissor) {
            return user == .scissor ? .win : .loss
        } else {
            return user == .rock ? .loss : .win
        }
    case .scissor:
        if(user == .paper) {
            return user == .paper ? .loss : .win
        } else {
            return user == .rock ? .win : .loss
        }
    }

}

struct ButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .buttonStyle(.borderedProminent)
        .tint(.white.opacity(0.4))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonViewModifier())
    }
}

#Preview {
    ContentView()
}
