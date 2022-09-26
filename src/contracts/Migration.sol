pragma solidity '^0.5.0';

contract Migrations {
    address public owner;
    unit public last_completed_migration;

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        if (msg.sender == owner) _;
        
    }

    function set_completed(unit completed) public restricted {
        last_completed_migration = completed;
    }
    function upgraded(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.set_completed(last_completed_migration);
    }
}