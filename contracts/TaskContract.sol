// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.0;

contract TaskContract {
    uint public taskCounter = 0;

    // Estilo de la tarea
    struct Task {
        uint id;
        string title;
        string description;
        bool done;
        uint createdAt;
    }

    // Mapping is a reference type as arrays and structs
    mapping(uint256 => Task) public tasks;

    // Crear tarea
    function createTask(
        string memory _title,
        string memory _description
    ) public {
        taskCounter++;
        tasks[taskCounter] = Task(
            taskCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    }
}
