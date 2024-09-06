// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {HeyKipu} from 'contracts/HeyKipu.sol';
import {Script} from 'forge-std/Script.sol';

contract Deploy is Script {
  address _owner;

  function setUp() public {
    // Sepolia
    _owner = vm.envAddress('SEPOLIA_DEPLOYER_ADDRESS');
  }

  function run() public {
    vm.startBroadcast();
    new HeyKipu(_owner);
    vm.stopBroadcast();
  }
}
