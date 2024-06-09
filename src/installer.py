import os
from typing import List


class Installer:
    @classmethod
    def _validate_packages_in_ar(cls, packages: List[str]) -> List[int]:
        exit_codes = []
        for package in packages:
            exit_codes.append(os.system("pacman -Ss " + package))
        
        return exit_codes

if __name__ == "__main__":
    print(Installer._validate_packages_in_ar(["vlc", "firefox"]))
