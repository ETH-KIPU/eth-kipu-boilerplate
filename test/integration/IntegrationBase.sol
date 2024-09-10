// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Test} from 'forge-std/Test.sol';
import {Deploy} from 'script/Deploy.sol';

contract IntegrationBase is Deploy, Test {
  uint256 internal constant _FORK_BLOCK = 6_643_655;

  function setUp() public virtual override {
    vm.createSelectFork(vm.envString('SEPOLIA_RPC'), _FORK_BLOCK);

    // Deployer setup
    _deployerPk = vm.deriveKey('test test test test test test test test test test test junk', 0);
    owner = makeAddr('Owner');

    run();
  }
}
