# Robot Framework Demo Project

![Robot Framework Version](https://img.shields.io/badge/Robot%20Framework-7.x-00C08B?style=flat-square&logo=robotframework&logoColor=white)
![Python Version](https://img.shields.io/badge/Python-3.x-3776AB?style=flat-square&logo=python&logoColor=white)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

A professional test automation proof of concept built with Robot Framework and Python.

By leveraging Robot Framework's versatile and intuitive architecture, this project aims to streamline quality assurance workflows and enhance development cycle efficiency.

## About Robot Framework

[Robot Framework](https://robotframework.org/) is a generic open-source automation framework for acceptance testing and robotic process automation (RPA). It features:
- Keyword-Driven Syntax: Uses human-readable tabular or plain-text syntax to make tests easy to write and maintain.
- Python Extensibility: Seamlessly integrates with custom Python libraries and helpers for advanced API request execution.
- Rich Reporting: Generates comprehensive HTML logs and XML test reports out of the box.

## Project Goals

- Automate Regression Testing: Ensure that new changes do not negatively impact existing functionality.
- Enhance Test Coverage: Increase the breadth and depth of test coverage across the target platform.
- Improve Efficiency: Reduce manual testing efforts and accelerate the release cycle.
- Maintain High Quality: Continuously monitor and improve the quality of the target platform through automated testing.

## Prerequisites

The following software dependencies are required:

- Python 3.14+

## Installation

1. Clone the repository `https://github.com/mdinehin/robot-framework-demo.git`
2. It is crucial to execute all subsequent commands as an administrator to ensure that the core Python interpreter, along with its subsequently installed dependencies and site packages, reside in the same location. To execute Windows commands as an administrator, follow these steps
3. Open the Start menu and type `cmd` or `Command Prompt` into the search bar
4. Right-click on `Command Prompt` and select `Run as administrator`
5. Confirm the action by clicking `Yes` in the User Account Control (UAC) window
6. Begin with updating Python's pip installer to the latest version
    - `python.exe -m pip install --upgrade pip`
7. Execute these commands to install Robot Framework and its dependencies
    - `pip install robotframework`
    - `pip install robotframework-requests`
    - `pip install robotframework-seleniumlibrary`
    - `pip install robotframework-datadriver`
    - `pip install pandas`

## Build and Test

Start by adding an `execution-profiles.csv` file to the `Resources` folder to store your execution profiles.

CSV Structure: `EnvironmentName,BaseUrl,AdminUsername,AdminPassword`

Executing tests from the command line does not require administrator privileges. To run the tests, use the `robot` command in the project root directory.

```bash
# Example
robot ^
--variable ExecutionProfile:demo ^
--variable RootDirectory:%CD% ^
--outputdir Results ^
--include TC_101457 ^
"Tests/API Pack/Incidents.robot"
```

| Parameter | Description |
| --- | --- |
| `robot` | The command to run Robot Framework tests |
| `^` | Caret, a Command Prompt line continuation character |
| `--variable` | Assigns a global variable with a specified value at runtime |
| `--outputdir Results` | Specifies the directory where the test results will be stored |
| `--include TC_101457` | Runs only the test cases with the provided tag |
| `"Tests/API Pack/Incidents.robot"` | The path to the test suite file to be executed |

## Commands

| Command | Description |
| --- | --- |
| `robot .` | Execute all test suites in folder |
| `robot --suite Suite1 --suite Suite2 .` | Execute multiple test suites in folder |
| `robot <filename>.robot` | Execute test suite |
| `robot --test <testname> .` | Execute test case |
| `robot --test "<testname>*" .` | Execute test cases by partial match (RegEx) |
| `robot --include <tagname> .` | Execute test cases by tag |
| `robot --include tag1ANDtag2 .` | Execute test cases that have both tag1 and tag2 |
| `robot --include tag1ORtag2 .` | Execute test cases that have either tag1 or tag2 |
| `robot --include tag1ANDtag2ORtag3 .` | Execute test cases that have both tag1 and tag2, or tag3 |
| `robot --exclude <tagname> .` | Exclude test cases by tag |
| `robot --rerunfailed output.xml` | Execute only failed test cases |

## Useful Links

- [Robot Framework](https://robotframework.org/) - Community, resources, and user guide.
- [Operating-system variables](https://robotframework.org/robotframework/2.9b2/RobotFrameworkUserGuide.html#operating-system-variables) - Make the test data operating-system-agnostic.
- [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html) - An always available standard library with often needed keywords.
- [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html) - Library providing keywords for handling lists and dictionaries.
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) - Library supporting browser automation.
- [XPath Cheat Sheet](https://gist.github.com/jmaccabee/550a0b9fcfdc7e6b170cd34c6ec7bc56#file-xpath-cheat-sheet) - Common XPath tips and tricks.
- [RequestsLibrary](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html) - Library aimed to provide HTTP api testing functionalities.
- [Pandas User Guide](https://pandas.pydata.org/docs/user_guide/) - Documentation for the Python data analysis library.
