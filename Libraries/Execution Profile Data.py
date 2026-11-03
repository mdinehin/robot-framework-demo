from robot.api.deco import library, keyword
import pandas as pd

@library
class ExecutionProfileData:

    """
    This class retrieves execution profile data for a specified environment from a CSV file.
    """

    @keyword
    def get_execution_profile_data(self, execution_profile):
        df = pd.read_csv('Resources/execution-profiles.csv')

        # Get the row where the first column (Environment) matches the provided execution profile
        matched_row = df.loc[df['Environment'] == execution_profile]

        # Convert the DataFrame object into a dictionary
        matched_row = matched_row.to_dict()

        execution_profile_data = {}

        # Transforming a nested dictionary, which contains dictionaries within dictionaries,
        # into a single, flat dictionary that contains all the elements in a sequential manner
        for key in matched_row.keys():
            for nested_key in matched_row[key].keys():
                execution_profile_data[key] = matched_row[key][nested_key]

        return execution_profile_data
