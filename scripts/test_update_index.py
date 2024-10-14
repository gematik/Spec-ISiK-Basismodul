import unittest
from unittest.mock import mock_open, patch
import datetime
from update_index import create_new_row, get_current_date_str, update_content, update_index_html, validate_version, read_index_html, find_insert_position

class TestUpdateIndex(unittest.TestCase):

    def test_update_index_with_redundant_version(self):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly handles a redundant version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and returns with status false.
        """
        version = "3.0.5"
        mock_file_content = """
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>
        """
        validation_result = validate_version(version, mock_file_content)
        self.assertEqual(validation_result, (False, f"Version {version} already exists in index.html."))

        


    def test_validate_version_with_incorrect_format(self, version="4.0", content=""):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version format.

        The test uses an incorrect version format that does not match the semver pattern.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        with patch("sys.exit") as mock_exit:
            content = ""  # Assuming content is an empty string for the test case
            validate_version(version, content)

    def test_validate_version_with_correct_format(self):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version format.

        The test uses a correct version format that matches the semver pattern.

        Asserts:
            The function does not print an error message and does not exit.
        """
        with patch("sys.exit") as mock_exit:
            version = "4.0.11"
            validation_result = validate_version(version,content="")
            self.assertEqual(validation_result, (True, "Version has no obvious issues."))

    def test_validate_version_with_redundant_version(self):
        """
        Test case for the `validate_version` function.

        This test verifies that the `validate_version` function correctly validates the version number being unequal to an existing version.

        The test uses a version number that is equal to an existing version number.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        version = "3.0.5"
        content = """
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>
        """
        validation_result = validate_version(version, content)
        self.assertEqual(validation_result, (False, f"Version {version} already exists in index.html."))    

    def test_find_insert_position_with_no_previous_version(self):
        """
        Test case for the `find_insert_position` function.

        This test verifies that the `find_insert_position` function correctly handles the case when no previous version is found in the index.html file.

        The test uses a mock file content with no previous version.

        Asserts:
            The function prints an error message and exits with status code 1.
        """
        version = "3.0.6"
        mock_file_content = ""
        position_result = find_insert_position(mock_file_content, version)
        self.assertEqual(position_result, (False, "No previous version found in index.html"))


    def test_find_insert_position_with_correct_previous_version_given_front_position_random_string_of_len_10(self):
        """
        Test case for the `find_insert_position` function.

        This test verifies that the `find_insert_position` function correctly finds the insert position when a correct previous version is given.

        The test uses a mock file content with a previous version.

        Asserts:
            The function returns the correct insert position.
        """
        version = "3.0.6"
        mock_file_content = """1234567890<tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
        </tr>
        <tr>
        <td>01.01.2022</td> 
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.4/ImplementationGuide-markdown-Einfuehrung.html">3.0.4</a>
        </td>
        <td>Technical Correction 3.0.4</td>
        <td>3.0.4</td>
        </tr>
        """
        position_result, message = find_insert_position(mock_file_content, version)
        self.assertEqual(position_result, 10)

    def test_find_insert_position_with_correct_previous_version_given_in_between_position(self):
        """
        Test case for the `find_insert_position` function.

        This test verifies that the `find_insert_position` function correctly finds the insert position when a correct previous version is given.

        The test uses a mock file content with a previous version.

        Asserts:
            The function returns the correct insert position.
        """
        version = "3.0.6"
        mock_file_content = """<tbody>
    </tr>
        <td colspan="4" style="background-color: #dddddd;">
            <strong>Basismodul Stufe 4</strong></td>
    </tr>
    <tr>
        <tr>
        <td>25.06.2024</td>
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/4.0.0-rc3/ImplementationGuide-markdown-Einfuehrung.html">4.0.0-rc3</a>
        </td>
        <td>Release Candidate Benehmensherstellung 4.0.0-rc3</td>
        <td>4.0.0-rc3</td>
        </tr>
        <tr>
        <td>04.04.2024</td>
        <td>
            <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/4.0.0-rc2/ImplementationGuide-markdown-Einfuehrung.html">4.0.0-rc2</a>
        </td>
        <td>Release Candidate Kommentierung 4.0.0-rc2</td>
        <td>4.0.0-rc2</td>
        </tr>
        <tr>
    </tr>
        <td colspan="4" style="background-color: #dddddd;">
            <strong>Basismodul Stufe 3</strong></td>
    </tr>
    <tr>
        <tr>
        <td>30.04.2024</td>
        <td>
          <a href="https://gematik.github.io/spec-ISiK-Basismodul/IG/3.0.5/ImplementationGuide-markdown-Einfuehrung.html">3.0.5</a>
        </td>
        <td>Technical Correction 3.0.5</td>
        <td>3.0.5</td>
      </tr>
      <tr>
    <tr>"""
        position_result, message = find_insert_position(mock_file_content, version)
        self.assertEqual(position_result, 968 ) 
        # 968 is the length before "<tr>
        # <td>30.04.2024</td> [...]", which is date for 3.0.5 element.'''
        #TODO not working correclty - fix issue in code



        

  

if __name__ == "__main__":
    unittest.main()