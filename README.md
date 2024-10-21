# CryptoZombie DApp

## Advanced Blockchain Technology(CPSC 559) - Under Professor Wenlin Han at California State University-Fullerton

## Team Zombie Squad

Venkata Abhinav Karthik Pulikonda ,
CWID: 885210294 ,
Email: abhinavpulikonda@csu.fullerton.edu

Manoj Gangavarapu ,
CWID : 885164319 ,
manojgangavarapu@csu.fullerton.edu

Sai Jagannadh Doddipatla ,
CWID : 885177436 ,
Saijagannadh@csu.fullerton.edu

Rakesh Puppala ,
CWID : 885175919 ,
Rakeshpuppala2591@csu.fullerton.edu

## Github Repo Link - https://github.com/manoj7032/CryptoZombies_Mid


### Project Overview

The CryptoZombie DApp is an innovative decentralized application built on the Ethereum blockchain, designed to offer users an engaging and interactive experience in the world of zombie creation and management. 

As part of our midterm project, the DApp combines elements of gaming, strategy, and blockchain technology, enabling users to create, customize, and battle their unique zombie creations.


## Improvements

Compared to the starter code, we made significant enhancements and added new features that improve the functionality, user experience, and design of the DApp:

1.	UI and Styling Enhancements:

•	We redesigned the entire UI, making the home screen more visually appealing.

•	Introduced a custom zombie interface that makes the zombies look scarier, enhancing the overall user experience.

•	Improved layout with better visuals, positioning, and responsiveness.

2.	Zombie Level Up and Level Down Features:

•	Implemented Level Up and Level Down features using specific zombie IDs. A user can now level up or down a particular zombie, which wasn't possible in the starter pack.

•	We added the Level Down button, which was missing in the starter pack, giving users more control over their zombie's level progression.

3.	Zombie Name Change Feature:

•	Introduced the ability to change the name of a specific zombie using a Zombie ID button. This feature allows users to personalize their zombie experience.

•	Additionally, we implemented a feature that prevents the creation or modification of duplicate zombies.

4.	Zombie Attack Feature:

  Implemented an Attack Feature where users can select one of their zombies and a target zombie to attack. After the attack:
•	If the selected zombie wins, a child zombie is created with the name starting with “child -” using the DNA of both the selected and targeted zombies, and the win/loss counts are updated accordingly.

•	If the targeted zombie wins, no new zombie will be created, maintaining the balance of the game.

•	This interactive feature makes the DApp more dynamic, allowing users to engage in battles, which was not included in the starter code.




5.	Zombie Factory - Multiple Zombie Creation:

•	In the starter pack, users could only create a single zombie. We expanded this functionality by allowing users to create multiple zombies using the Create Zombie button, effectively turning the DApp into a "zombie factory."

•	Users can create a new zombie anytime, each with unique attributes, making the DApp more engaging and fun.

6.	Kitty Creation Feature:

•	We added the ability to create kitties in addition to zombies. Users can create kitties with unique DNA, adding a new layer of interaction where kitties can be created and used with zombies.

•	This feature was entirely missing in the starter pack, giving users additional functionality to enjoy.

7.	Zombie and Kitty Display:

•	We improved the UI for displaying both zombies and kitties in a more organized and visually engaging manner. Zombies and kitties are displayed with their attributes, such as DNA, level, wins, losses, etc., making it easier for users to track and interact with their creations.

8.	MetaMask and Web3 Integration:

•	We updated the Web3 and MetaMask integration to work with modern browsers and Ethereum standards. The starter pack used outdated Web3 methods that are no longer supported.

•	Our version ensures smooth interaction with MetaMask and the blockchain, offering better error handling and a more stable connection.

9.	Additional Improvements:

•	We removed obsolete code from the starter pack and modernized the DApp’s interaction logic, ensuring it is more efficient and works seamlessly with blockchain updates.

•	We also improved the status messaging for blockchain interactions, displaying clearer and more user-friendly messages.



## Instructions to Set Up and Run

1. Clone the repository and navigate to the project directory.
2. Compile the smart contracts using Truffle by running truffle compile in your terminal.
3. Deploy the smart contracts on your local blockchain (e.g., using Ganache) by running truffle migrate.
4. After deploying the contracts, update the ownership addresses for both the zombie and kitty contracts in the index.html file:
5. Replace the placeholder contract addresses in the code with the correct ones from your Ganache deployment.
6. Start a local development server:
7. Run truffle develop or npm run start to start the server.
8. Once the server starts, use the address provided by the terminal (e.g., localhost:3000) to open the DApp in your browser.
9. Ensure that MetaMask is installed and connected to your local blockchain.


Use the provided buttons to interact with the zombies and kitties. Features include:

1.	Show Zombies: Displays all zombies owned by the user.
2.	Create Zombie: Creates a new zombie with random attributes.
3.	Level Up: Levels up the selected zombie with the input id.
4.	Level Down : Levels down the selected zombie with the input id.
5.	Change Zombie Name: Change the name of a particular zombie using its ID.
6.	Attack Zombie: Allows your zombie to attack another using select zombie and Target Zombie ids.
7.	Create Kitty: Creates a new kitty with a custom DNA string.
8.	Show Kitty : Shows all the kittys that are created


•	Ensure Web3.js is correctly integrated and connected to a blockchain provider such as Infura or MetaMask.
