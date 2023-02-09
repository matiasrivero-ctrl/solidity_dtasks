const TaskContract = artifacts.require('Task');

module.exports = function (deployer) {
  deployer.deploy(TaskContract);
};
