import os
from typing import List


class Installer:
    @classmethod
    def _validate_packages_in_ar(cls, packages: List[str]) -> int:
        package_str = ""
        for package in packages:
            package_str += f"{package} "
        
        return os.system("pacman -Ss " + package_str)


if __name__ == "__main__":
    print(Installer._validate_packages_in_ar(["vlc", "firefox"]))
