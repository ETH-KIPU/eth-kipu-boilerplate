// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IntegrationBase} from 'test/integration/IntegrationBase.sol';

contract IntegrationHeyKipu is IntegrationBase {
  function test_Greet() public {
    // it sets the greeting
    string memory _greeting = 'Hey, Kipu!';

    vm.prank(_owner);
    _keyKipu.setGreeting(_greeting);

    assertEq(_keyKipu.greeting(), _greeting);
  }
}
