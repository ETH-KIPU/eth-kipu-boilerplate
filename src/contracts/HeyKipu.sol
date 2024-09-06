// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IHeyKipu} from 'interfaces/IHeyKipu.sol';

contract HeyKipu is IHeyKipu {
  /// @inheritdoc IHeyKipu
  address public immutable OWNER;

  /// @inheritdoc IHeyKipu
  string public greeting;

  /**
   * @notice Reverts in case the function was not called by the owner of the contract
   */
  modifier onlyOwner() {
    if (msg.sender != OWNER) {
      revert HeyKipu_OnlyOwner();
    }
    _;
  }

  /**
   * @notice Defines the owner of the contract
   * @param _owner The owner of the contract
   */
  constructor(address _owner) {
    if (_owner == address(0)) {
      revert HeyKipu_InvalidOwner();
    }
    OWNER = _owner;
  }

  /// @inheritdoc IHeyKipu
  function setGreeting(string memory _greeting) public onlyOwner {
    if (keccak256(bytes(_greeting)) == keccak256(bytes(greeting))) {
      revert HeyKipu_InvalidGreeting();
    }

    greeting = _greeting;
    emit GreetingSet(_greeting);
  }
}
