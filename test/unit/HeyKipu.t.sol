// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

import {HeyKipu, IHeyKipu} from 'contracts/HeyKipu.sol';
import {Test} from 'forge-std/Test.sol';

/**
 * @notice This contract is a test helper to test the HeyKipu contract
 */
contract HeyKipuForTest is HeyKipu {
  constructor(address _owner) HeyKipu(_owner) {}

  function setGreetingForTest(string memory _greeting) external {
    greeting = _greeting;
  }
}

contract UnitHeyKipu is Test {
  /// Contracts
  HeyKipuForTest internal _heyKipu;

  /// EOAs
  address internal _owner = makeAddr('owner');

  /// Events
  event GreetingSet(string _greeting);

  function setUp() external {
    _heyKipu = new HeyKipuForTest(_owner);
  }
}

/**
 * @notice This contract tests the constructor of the HeyKipu contract
 */
contract Unit_HeyKipu_Constructor is UnitHeyKipu {
  /**
   * @notice This test verifies that the constructor reverts when passing an empty owner
   */
  function test_ConstructorWhenPassingAnEmptyOwner() external {
    // it reverts
    vm.expectRevert(IHeyKipu.HeyKipu_InvalidOwner.selector);
    _heyKipu = new HeyKipuForTest(address(0));
  }

  /**
   * @notice This test verifies that the constructor sets the owner as the sender
   */
  function test_Constructor(address _owner) external {
    vm.assume(_owner != address(0));
    vm.prank(_owner);

    // it deploys
    _heyKipu = new HeyKipuForTest(_owner);

    // it sets the owner as sender
    assertEq(_heyKipu.OWNER(), _owner);
  }
}

/**
 * @notice This contract tests the setGreeting function of the HeyKipu contract
 */
contract Unit_HeyKipu_SetGreet is UnitHeyKipu {
  /**
   * @notice This test verifies that the setGreeting function reverts when the caller is not the owner
   */
  function test_SetGreetingWhenCallerIsNotTheOwner(string memory _greeting) external {
    // it reverts
    vm.expectRevert(IHeyKipu.HeyKipu_OnlyOwner.selector);
    _heyKipu.setGreeting(_greeting);
  }

  /**
   * @notice This test verifies that the setGreeting function reverts when passing an invalid greeting string
   */
  function test_SetGreetingWhenPassingAnInvalidGreetingString(string memory _greeting) external {
    _heyKipu.setGreetingForTest(_greeting);

    // it reverts
    vm.expectRevert(IHeyKipu.HeyKipu_InvalidGreeting.selector);
    vm.prank(_owner);
    _heyKipu.setGreeting(_greeting);
  }

  /**
   * @notice This test verifies that the setGreeting function reverts when the caller is not the owner
   */
  function test_SetGreetingWhenPassingAValidGreetingString(string memory _greeting) external {
    vm.assume(keccak256(bytes(_greeting)) != keccak256(bytes('')));
    // it emit GreetingSet
    vm.expectEmit(true, true, true, true);
    emit GreetingSet(_greeting);

    vm.prank(_owner);
    _heyKipu.setGreeting(_greeting);

    // it sets the greeting string
    assertEq(_heyKipu.greeting(), _greeting);
  }
}
