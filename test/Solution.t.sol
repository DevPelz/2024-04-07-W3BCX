// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "forge-std/Script.sol";
import {MyVault} from "../src/MyVault.sol";
import {Forwarder} from "src/Forwarder.sol";
import {Token} from "../src/Token.sol";

import "openzeppelin/utils/cryptography/SignatureChecker.sol";

contract Deploy is Script {
    Forwarder public forwarder;
    Token public a;
    Token public b;
    MyVault public vault;

    function setUp() external {
        vm.createSelectFork("YOUR_SEPOLIA_RPC_URL");

        forwarder = Forwarder(0x9FfA2f219A0590db1452273012f97344b0f71CEB);
        a = Token(0x2A24Fda81786fbCFCb43aA7DaBa2F34BF6115383);
        b = Token(0xAC97A7333982A170A3512bE4Ccb6A25d06004E63);
        vault = MyVault(0x1A6AbFC7D750Cbe2f7c2cc52329CD22fb7AE5Aae);
    }

    function testHack() public {
        hack();
        assert(vault.confirmHack());
    }

    function hack() internal {
        // Let's see what you can do
    }
}
