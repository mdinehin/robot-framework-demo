# DCIQ Robot Framework Project

## Introduction 
Welcome to the DCIQ Robot Framework Project! This repository contains automated test scripts designed to ensure the quality and reliability of the DCIQ platform. Using Robot Framework, a versatile and easy-to-use test automation framework, we aim to streamline the testing process and enhance the efficiency of our development cycle. 

### About Robot Framework
Robot Framework is an open-source automation framework that supports both keyword-driven and behavior-driven testing. It is highly extensible, allowing integration with various libraries and tools to create robust test suites. With its simple syntax and powerful capabilities, Robot Framework is an ideal choice for automating tests for web applications, APIs, and more.

### Project Goals
- **Automate Regression Testing**: Ensure that new changes do not negatively impact existing functionality.
- **Enhance Test Coverage**: Increase the breadth and depth of test coverage across the DCIQ platform.
- **Improve Efficiency**: Reduce manual testing efforts and accelerate the release cycle.
- **Maintain High Quality**: Continuously monitor and improve the quality of the DCIQ platform through automated testing.

## Getting Started
To get started with this project, please refer to the Installation and Usage sections below for detailed instructions on setting up and running the tests.

We hope you find this project useful and welcome any contributions or feedback to help us improve!

### Installation
Set up your local development environment by following this Confluence guide created by Team Optima. This page provides comprehensive instructions on configuring the development environment, including connecting to GitHub using a Personal Access Token (PAT), installing Python, and setting up PyCharm and its plugins to ensure a smooth workflow.

[How-to setup environment](https://rldatix.atlassian.net/wiki/spaces/OP/pages/3223781706/How-to+setup+environment)

You can consider the setup complete once you reach four-fifths of the way through Optima's guide, at which point the Python Interpreter is configured. There is no need for configuring keyboard shortcuts in PyCharm, at least for now.

With the help of Optima's guide, you should have the below list of software installed:
- Git for Windows
- SourceTree, or an alternative Git client
- GitHub Personal Access Token (PAT)
- Python 3 installed for all users in `C:\Program Files\Python313` (Windows file path with backslashes)
  - Note: When Python is installed only for the current user in the `AppData` directory instead of for all users in `C:\Program Files\Python313`, PyCharm frequently loses the configured Python interpreter, reverting to the default interpreter location in Program Files, which causes disruptions in the development environment.
  - Installing Python in the indicated directory will ensure that the core Python interpreter, along with its subsequently installed dependencies and site packages, reside in the same location.
- PyCharm Community Edition
- Python interpreter in PyCharm settings pointing at `C:/Program Files/Python313/python.exe` (Unix file path with forward slashes)
- PyCharm plugin: Hyper RobotFramework Support
- PyCharm plugin: CodeGlance Pro

### Robot Framework and Dependencies

It is crucial to execute all commands as an administrator to ensure that the core Python interpreter, along with its subsequently installed dependencies and site packages, reside in the same location. To execute Windows commands as an administrator, follow these steps:
1. Open the Start menu and type `cmd` or `Command Prompt` into the search bar.
2. Right-click on `Command Prompt` and select `Run as administrator`.
3. Confirm the action by clicking `Yes` in the User Account Control (UAC) window.

Begin with updating Python's pip installer to the latest version:
- python.exe -m pip install --upgrade pip

Execute these commands to install Robot Framework and its dependencies:
- pip install robotframework
- pip install robotframework-requests
- pip install robotframework-seleniumlibrary
- pip install robotframework-datadriver
- pip install pandas

## Build and Test
Executing tests from the command line does not require administrator privileges. To run the tests, use the `robot` command in the project root directory, specifying the path to the test files. Example:

    cd code\dciq-automationtests
    robot --variable ExecutionProfile:qadevelopauto -d Results --include sample_get_request "Tests/Samples/Sample Test Suite.robot"

* `robot`: The command to run Robot Framework tests.
* `-d Results`: Specifies the directory where the test results will be stored.
* `--include sample_get_request`: Runs only the test cases that are tagged with `sample_get_request`.
* `"Tests/Samples/Sample Test Suite.robot"`: The path to the test suite file to be executed.

### Run Command Examples

| Scenario                                                 | Command                                 |
|----------------------------------------------------------|-----------------------------------------|
| Execute all test suites in folder                        | `robot .`                               |
| Execute multiple test suites in folder                   | `robot --suite Suite1 --suite Suite2 .` |
| Execute test suite                                       | `robot <filename>.robot`                |
| Execute test case                                        | `robot --test <testname> .`             |
| Execute test cases by partial match (RegEx)              | `robot --test "<testname>*" .`          |
| Execute test cases by tag                                | `robot --include <tagname> .`           |
| Execute test cases that have both tag1 and tag2          | `robot --include tag1ANDtag2 .`         |
| Execute test cases that have either tag1 or tag2         | `robot --include tag1ORtag2 .`          |
| Execute test cases that have both tag1 and tag2, or tag3 | `robot --include tag1ANDtag2ORtag3 .`   |
| Exclude test cases by tag                                | `robot --exclude <tagname> .`           |
| Execute only failed test cases                           | `robot --rerunfailed output.xml`        |

As another option, use the Run feature in PyCharm to execute tests.

## Useful Links
- [Engineering/dciq-automationtests](https://github.com/rld-engineering/dciq-automationtests): DCIQ repository for Robot Framework.
- [Robot Framework](https://robotframework.org/): Community, resources, and user guide.
- [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html): An always available standard library with often needed keywords.
- [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html): Library providing keywords for handling lists and dictionaries.
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html): Library supporting browser automation.
- [XPath Cheat Sheet](https://gist.github.com/jmaccabee/550a0b9fcfdc7e6b170cd34c6ec7bc56#file-xpath-cheat-sheet): Common XPath tips and tricks.
- [RequestsLibrary](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html): Library aimed to provide HTTP api testing functionalities.
- [Udemy: Robot Framework with Python](https://www.udemy.com/course/robot-framework-with-python-selenium/): In-depth on-demand video course.
- [Pandas User Guide](https://pandas.pydata.org/docs/user_guide/): Documentation for the Python data analysis library.