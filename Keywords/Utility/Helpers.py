# Using a Python script in Robot Framework can offer greater flexibility, efficiency,
# and maintainability for complex operations compared to using built-in keywords.
#
# Alternatively to the Page Object Model (POM) architecture in test automation, the
# Page Component Model (PCM) focuses on modeling smaller, reusable components within
# a page rather than entire pages. This approach can reduce complexity and improve
# maintainability, especially for applications with dynamic content.
#
# This class provides reusable functions, methods, and common code snippets that can be
# used across multiple test scripts to streamline and simplify test automation processes.
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
import time

@library
class Helpers:

    # Referencing BuiltIn() in the class constructor __init__(self) before
    # the test starts may result in error "Cannot access execution context".

    @keyword
    def get_current_timestamp(self):
        return int(time.time())

    @keyword
    def join_list_of_items(self, items_list):
        joined_string = ' '.join(items_list)
        BuiltIn().log_to_console('Joined string: ' + joined_string)
        return joined_string

    @keyword
    def use_selenium_library_instance(self):
        xpath = "//div[@id='module-name-text-orientation']/h1"
        selenium_instance = BuiltIn().get_library_instance('SeleniumLibrary')
        selenium_instance.wait_until_element_is_visible(xpath)
        selenium_instance.element_text_should_be(xpath, 'Incidents')
