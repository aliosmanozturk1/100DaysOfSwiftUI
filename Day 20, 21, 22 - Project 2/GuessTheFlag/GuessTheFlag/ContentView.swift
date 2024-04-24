//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ali Osman Öztürk on 23.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingScoreAndTrueFlag = false
    
    @State private var tappedButton = 0
    @State private var tappedButtonState = false
    
    @State private var falseFlag = 0
    
    @State private var scoreTitle = ""

    @State private var userScore = 0

    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK",
        "Ukraine", "US",
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400
            )
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0 ..< 3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert(scoreTitle, isPresented: $showingScoreAndTrueFlag) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)\n" + "Wrong! That's the flag of \(countries[falseFlag]) ")
        }
        .alert("Game Finished", isPresented: $tappedButtonState) {
            Button("Okey", action: resetGame)
        } message: {
            Text("Your final score is \(userScore)")
        }
    }

    func flagTapped(_ number: Int) {
        tappedButton = tappedButton + 1
        
        if tappedButton >= 3 {
            tappedButtonState = true
        }
        
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore = userScore + 1
            showingScore = true
        }
        else {
            scoreTitle = "Wrong"
            userScore = userScore - 1
            
            falseFlag = number

            showingScoreAndTrueFlag = true
            if userScore < 0 {
                userScore = 0
            }
        }
    }
    
    func resetGame() {
        tappedButton = 0
        userScore = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
