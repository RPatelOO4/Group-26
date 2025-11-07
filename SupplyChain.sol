pragma solidity ^0.8.0;
/**
 @group 26
 @title PharmaSupplyChain
 @dev this is the main smart contract that we made for handling the pharma supply chain provenance. 
 it basically keeps track of the products and raw materials as they move around.  

 the idea is to make sure we can see where stuff came from and who had it before. 
 it’s about transparency and making sure the medicine is authentic.  
*/


import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PharmaSupplyChain is AccessControl, ReentrancyGuard {
    using Counters for Counters.Counter;


    // ----------------------------------------
    // STATE VARIABLES
    // ----------------------------------------
    
    // Role definitions for access control
    bytes32 public constant MANUFACTURER_ROLE = keccak256("MANUFACTURER_ROLE");
    bytes32 public constant DISTRIBUTOR_ROLE = keccak256("DISTRIBUTOR_ROLE");
    bytes32 public constant PHARMACIST_ROLE = keccak256("PHARMACIST_ROLE");
    bytes32 public constant REGULATOR_ROLE = keccak256("REGULATOR_ROLE");
    
    // Counters for unique IDs
    Counters.Counter private _productIdCounter;
    Counters.Counter private _materialIdCounter;
    Counters.Counter private _batchIdCounter;
    Counters.Counter private _batchIdCounter;
