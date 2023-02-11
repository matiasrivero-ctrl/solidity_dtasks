// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.17;

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

    // Event is an inheritable member of a contract. An event is emitted, it stores the arguments passed in transaction logs. These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain. An event generated is not accessible from within contracts, not even the one which have created and emitted them.
    event TaskCreated(
        uint256 id,
        string title,
        string description,
        bool done,
        uint createdAt
    );

    event TaskDone(uint256 _id, bool done);

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

        emit TaskCreated(
            taskCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    }

    // Marcar tarea como hecha
    function toggleDone(uint256 _id) public {
        Task memory task = tasks[_id];
        task.done = !task.done;
        tasks[_id] = task;

        emit TaskDone(_id, task.done);
    }
}
