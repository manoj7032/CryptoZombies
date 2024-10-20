 export const leaderboardABI = [
    {
        "constant": true,
        "inputs": [],
        "name": "getLeaderboard",
        "outputs": [
          {
            "components": [
              { "name": "name", "type": "string" },
              { "name": "winCount", "type": "uint256" }
            ],
            "name": "",
            "type": "tuple[]"
          }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
      }
    ]