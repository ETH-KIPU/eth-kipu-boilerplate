// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IntegrationBase} from 'test/integration/IntegrationBase.sol';

contract IntegrationHeyKipu is IntegrationBase {
  function test_Greet() public {
    // it sets the greeting
    string memory _greeting = 'Hey, Kipu!';

    vm.prank(owner);
    heyKipu.setGreeting(_greeting);

    assertEq(heyKipu.greeting(), _greeting);
  }
}
