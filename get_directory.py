"""
Get Directory
meadosc 2020

Get the name of home directory of parent directory. Use the home directory for file
path construction to avoid relative path errors.
"""


from os.path import abspath, dirname


def get_directory():
    """
    Get the name of home directory of parent directory. Use the home directory for file
    path construction to avoid relative path errors.
    """
    home_dir = dirname(dirname(abspath(__file__)))  # call dirname twice to get parent dir
    return home_dir
