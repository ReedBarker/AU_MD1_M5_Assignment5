import Foundation

class AdventureNode {
    var previousUserAction: String
    var queryUserAction: String
    var optionOne: String            // Top Button
    var optionTwo: String            // Bot Button
    var left: AdventureNode? = nil   // Left node
    var right: AdventureNode? = nil  // Right node

    init(previousUserAction: String, queryUserAction: String, optionOne: String, optionTwo: String) {
        self.previousUserAction = previousUserAction
        self.queryUserAction = queryUserAction
        self.optionOne = optionOne
        self.optionTwo = optionTwo
    }
}

class AdventureTree {
    var root: AdventureNode

    init() {
    // Layer 0 (Root)
        root = AdventureNode(
            previousUserAction: "You stand before the ancient keep of Shadows.",
            queryUserAction: "Enter via the main gate or search for a secret entrance?",
            optionOne: "Main gate",
            optionTwo: "Secret entrance"
        )
        
    // Layer 1
        // Main gate branch
        let mainGateNode = AdventureNode(
            previousUserAction: "You enter through the main gate.",
            queryUserAction: "Inside, follow the corridor or explore the guardroom?",
            optionOne: "Follow corridor",
            optionTwo: "Explore guardroom"
        )
        
        // Secret entrance branch
        let secretEntranceNode = AdventureNode(
            previousUserAction: "You find a hidden passage behind ivy.",
            queryUserAction: "Proceed quietly or ready your weapon?",
            optionOne: "Proceed quietly",
            optionTwo: "Ready weapon"
        )
        
        root.left = mainGateNode
        root.right = secretEntranceNode
        
    // Layer 2
        // mainGateNode
        let followCorridor = AdventureNode(
            previousUserAction: "You follow the corridor.",
            queryUserAction: "Search for treasure or follow mysterious footsteps?",
            optionOne: "Search treasure",
            optionTwo: "Follow footsteps"
        )
        
        let exploreGuardroom = AdventureNode(
            previousUserAction: "You explore the guardroom.",
            queryUserAction: "Inspect locked chests or examine strange symbols?",
            optionOne: "Inspect chests",
            optionTwo: "Examine symbols"
        )
        
        mainGateNode.left = followCorridor
        mainGateNode.right = exploreGuardroom
        
        // secretEntranceNode
        let proceedQuietly = AdventureNode(
            previousUserAction: "You proceed quietly.",
            queryUserAction: "Search the library or check the armory?",
            optionOne: "Search library",
            optionTwo: "Check armory"
        )
        
        let readyWeapon = AdventureNode(
            previousUserAction: "You ready your weapon.",
            queryUserAction: "Confront a threat or guard the passage?",
            optionOne: "Confront threat",
            optionTwo: "Guard passage"
        )
        
        secretEntranceNode.left = proceedQuietly
        secretEntranceNode.right = readyWeapon
        
    // Layer 3
        // followCorridor
        let searchTreasure = AdventureNode(
            previousUserAction: "You search for treasure.",
            queryUserAction: "Hidden vault discovered. Open it or inspect further?",
            optionOne: "Open vault",
            optionTwo: "Inspect further"
        )
        
        let followFootsteps = AdventureNode(
            previousUserAction: "You follow mysterious footsteps.",
            queryUserAction: "Footsteps lead to a secret room. Investigate or call help?",
            optionOne: "Investigate",
            optionTwo: "Call help"
        )
        
        followCorridor.left = searchTreasure
        followCorridor.right = followFootsteps
        
        // exploreGuardroom
        let inspectChests = AdventureNode(
            previousUserAction: "You inspect the chests.",
            queryUserAction: "Chests contain relics. Take one or leave them?",
            optionOne: "Take relic",
            optionTwo: "Leave chests"
        )
        
        let examineSymbols = AdventureNode(
            previousUserAction: "You examine the symbols.",
            queryUserAction: "Symbols form a riddle. Solve it or ignore?",
            optionOne: "Solve riddle",
            optionTwo: "Ignore"
        )
        
        exploreGuardroom.left = inspectChests
        exploreGuardroom.right = examineSymbols
        
        // proceedQuietly
        let searchLibrary = AdventureNode(
            previousUserAction: "You search the library.",
            queryUserAction: "Books hint secrets. Read closely or skip details?",
            optionOne: "Read closely",
            optionTwo: "Skip details"
        )
        
        let checkArmory = AdventureNode(
            previousUserAction: "You check the armory.",
            queryUserAction: "Armory holds weapons. Use one or leave them?",
            optionOne: "Use weapon",
            optionTwo: "Leave armory"
        )
        
        proceedQuietly.left = searchLibrary
        proceedQuietly.right = checkArmory
        
        // readyWeapon
        let confrontThreat = AdventureNode(
            previousUserAction: "You confront the threat.",
            queryUserAction: "A lurking enemy appears. Fight or hide?",
            optionOne: "Fight",
            optionTwo: "Hide"
        )
        
        let guardPassage = AdventureNode(
            previousUserAction: "You guard the passage.",
            queryUserAction: "Activity detected. Investigate or hold position?",
            optionOne: "Investigate",
            optionTwo: "Hold position"
        )
        
        readyWeapon.left = confrontThreat
        readyWeapon.right = guardPassage
    }
}
