local Expectation = require("./src/Expectation")
local TestBootstrap = require("./src/TestBootstrap")
local TestEnum = require("./src/TestEnum")
local TestPlan = require("./src/TestPlan")
local TestPlanner = require("./src/TestPlanner")
local TestResults = require("./src/TestResults")
local TestRunner = require("./src/TestRunner")
local TestSession = require("./src/TestSession")
local TextReporter = require("./src/Reporters/TextReporter")
local TextReporterQuiet = require("./src/Reporters/TextReporterQuiet")
local TeamCityReporter = require("./src/Reporters/TeamCityReporter")

local function run(testRoot, callback)
	local modules = TestBootstrap:getModules(testRoot)
	local plan = TestPlanner.createPlan(modules)
	local results = TestRunner.runPlan(plan)

	if callback then
		callback(results)
	else
		TextReporter.report(results)
	end
end

local TestEZ = {
	run = run,

	Expectation = Expectation,
	TestBootstrap = TestBootstrap,
	TestEnum = TestEnum,
	TestPlan = TestPlan,
	TestPlanner = TestPlanner,
	TestResults = TestResults,
	TestRunner = TestRunner,
	TestSession = TestSession,

	Reporters = {
		TextReporter = TextReporter,
		TextReporterQuiet = TextReporterQuiet,
		TeamCityReporter = TeamCityReporter,
	},
}

return TestEZ