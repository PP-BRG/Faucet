// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IERC20 {
    /**
     * @dev Returns the tokens owned by `account`
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev returns the decimal places of a token
     */
    function decimals() external view returns (uint8);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`
     *
     * Returns a boolean value indicating whether the operation succeeded
     *
     * Emits a {Transfer} event
     */
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);
}

contract Faucet {
    // The underlying token of the Faucet
    IERC20 token;

    // The address of the faucet owner
    address owner;

    // For rate limiting
    mapping(address => uint256) nextRequestAt;

    // Num of tokens to send when requested
    uint256 faucetDripAmount = 1;

    // Sets the address of the Owner and the underlying token
    constructor(address tokenAddress, address ownerAddress) {
        token = IERC20(tokenAddress);
        owner = ownerAddress;
    }

    // Verifies whether the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Faucet Error: Caller must be owner");
        _;
    }

    // Sends the amount of token to the caller
    function send() external {
        require(
            token.balanceOf(address(this)) > 1,
            "Faucet Error: Pool is empty"
        );
        require(
            nextRequestAt[msg.sender] < block.timestamp,
            "Faucet Error: Try again later"
        );

        // Next request from the address can be made only after 1 minutes
        nextRequestAt[msg.sender] = block.timestamp + (1 minutes);

        token.transfer(msg.sender, faucetDripAmount * 10**token.decimals());
    }

    // Updates the underlying token address
    function setTokenAddress(address tokenAddr) external onlyOwner {
        token = IERC20(tokenAddr);
    }

    // Updates the drip rate
    function setFaucetDripAmount(uint256 amount) external onlyOwner {
        faucetDripAmount = amount;
    }

    // Allows the owner to withdraw tokens from the contract
    function withdrawTokens(address receiver, uint256 amount)
        external
        onlyOwner
    {
        require(
            token.balanceOf(address(this)) >= amount,
            "Faucet Error: Insufficient funds"
        );
        token.transfer(receiver, amount);
    }
}
