# MyToken Contract

The **MyToken** contract is an ERC-20 compliant token smart contract implemented on the Ethereum blockchain. It allows users to create and manage tokens with the standard functionalities of transfer, approval, and allowance.

## Features

- **Token Information**
    - Name: [Token Name]
    - Symbol: [Token Symbol]
    - Decimals: [Number of Decimals]
    - Total Supply: [Total Supply of Tokens]

- **Contract Owner**
    - The contract is owned by the deployer (creator) of the contract.

- **Token Balances**
    - Users can check their token balance through the `balanceOf` function.

- **Transfer Tokens**
    - Users can transfer tokens to other addresses using the `transfer` function.

- **Approve and TransferFrom**
    - Users can grant allowances to other addresses to spend tokens on their behalf using `approve` and `transferFrom` functions.

- **Mint Tokens**
    - The contract owner can create new tokens and assign them to any address using the `mint` function.

- **Burn Tokens**
    - Users can burn (destroy) their own tokens using the `burn` function.

- **Increase/Decrease Allowance**
    - Users can increase or decrease the allowance provided to another address using `increaseAllowance` and `decreaseAllowance` functions.

## Usage

1. Deploy the contract, providing the following parameters:
   - Token Name: [Name]
   - Token Symbol: [Symbol]
   - Decimals: [Number of Decimals]
   - Initial Supply: [Initial Supply Amount]

2. After deployment, the contract owner will be the account that deployed the contract.

3. Users can interact with the contract to transfer tokens, approve others for spending, and manage allowances.

4. Only the contract owner can mint new tokens.

## Important Points

- Always verify the contract address and source code before interacting with the contract.

- Ensure to have enough gas while executing transactions to avoid out-of-gas errors.

- Use appropriate gas limits when interacting with the contract to avoid overspending.

- Tokens sent to the contract address directly will be lost and cannot be recovered.

- The contract owner has significant control over the token supply and should be trusted.

## License

This project is licensed under the MIT License. See the [LICENSE] file for details.
