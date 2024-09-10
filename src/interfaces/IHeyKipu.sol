// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Hey Kipu
 */
interface IHeyKipu {
  /*///////////////////////////////////////////////////////////////
                            EVENTS
  //////////////////////////////////////////////////////////////*/
  /**
   * @notice Greeting has been set
   * @param _greeting The new greeting
   */
  event GreetingSet(string _greeting);

  /*///////////////////////////////////////////////////////////////
                            ERRORS
  //////////////////////////////////////////////////////////////*/
  /**
   * @notice Throws if the caller is not the owner
   */
  error HeyKipu_OnlyOwner();

  /**
   * @notice Throws if the owner set is invalid because it is the zero address
   */
  error HeyKipu_InvalidOwner();

  /**
   * @notice Throws if the greeting set is invalid because it is the same as the previous one
   */
  error HeyKipu_InvalidGreeting();

  /*///////////////////////////////////////////////////////////////
                            VARIABLES
  //////////////////////////////////////////////////////////////*/
  /**
   * @notice Returns the owner of the contract
   * @return _owner The owner of the contract
   */
  function OWNER() external view returns (address _owner);

  /**
   * @notice Returns the greeting
   * @return _greet The greeting
   */
  function greeting() external view returns (string memory _greet);

  /*///////////////////////////////////////////////////////////////
                            LOGIC
  //////////////////////////////////////////////////////////////*/
  /**
   * @notice Sets a new greeting
   * @dev Only callable by the owner
   * @param _newGreeting The new greeting to be set
   */
  function setGreeting(string memory _newGreeting) external;
}
