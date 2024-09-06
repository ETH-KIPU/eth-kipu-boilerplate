// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {HeyKipu, IHeyKipu} from 'contracts/HeyKipu.sol';
import {Test} from 'forge-std/Test.sol';

contract IntegrationBase is Test {
  uint256 internal constant _FORK_BLOCK = 18_920_905;

  address internal _owner = makeAddr('owner');
  IHeyKipu internal _keyKipu;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('sepolia'), _FORK_BLOCK);
    _keyKipu = new HeyKipu(_owner);
  }
}
