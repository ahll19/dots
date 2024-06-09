import subprocess as sp
from typing import List


class Installer:
    @classmethod
    def _validate_packages_in_ar(cls, packages: List[str]) -> List[int]:
        exit_codes = []
        for package in packages:
            proc = sp.run("pacman -Ss " + package, shell=True, capture_output=True)
            exit_codes.append(proc.stdout)

        return exit_codes


if __name__ == "__main__":
    print(Installer._validate_packages_in_ar(["vlc", "firefox"]))
