import os
from typing import List


class Installer:
    @classmethod
    def _validate_packages_in_ar(cls, packages: List[str]) -> int:
        for package in packages:
            exit_code = os.system("pacman -Ss " + package)
            if exit_code > 0:
                print("wtf")
                return exit_code

            return 0


if __name__ == "__main__":
    print(Installer._validate_packages_in_ar(["firefox"]))
