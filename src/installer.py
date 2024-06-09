import subprocess as sp
from typing import List
from argparse import ArgumentParser


class PackageError(Exception):
    def __init__(self, message: str):
        super().__init__(message)


class Installer:
    @classmethod
    def _validate_packages_in_ar(cls, packages: List[str]) -> List[bool]:
        outputs = []
        for package in packages:
            proc = sp.run("pacman -Ss " + package, shell=True, capture_output=True)
            outputs.append(proc.stdout.decode("utf-8"))

        return cls._validate_packages(outputs, packages)

    @classmethod
    def _validate_packages_in_aur(cls, packages: List[int]) -> List[bool]:
        outputs = []
        for package in packages:
            proc = sp.run("yay -Ss " + package, shell=True, capture_output=True)
            outputs.append(proc.stdout.decode("utf-8"))

        return cls._validate_packages(outputs, packages)

    @classmethod
    def _validate_packages(cls, outputs: List[str], packages: List[str]) -> List[bool]:
        searched_packages = []
        for output in outputs:
            for line in output.split("\n"):
                if line.startswith(" "):
                    continue

                package = line.split(" ")[0].split("/")[-1]
                if len(package) == 0:
                    continue

                searched_packages.append(package)

        package_exists = []
        for package in packages:
            package_exists.append(package in searched_packages)

        return package_exists
    
    @classmethod
    def install(cls, packages: List[str]):
        pkg_in_ar = cls._validate_packages_in_ar(packages)
        pkg_in_aur = cls._validate_packages_in_aur(packages)

        for i in range(len(packages)):
            if not (pkg_in_ar[i] or pkg_in_aur[i]):
                raise PackageError("Package not found: " + packages[i])
        
        for i in range(len(packages)):
            if pkg_in_ar[i]:
                sp.run("sudo pacman -S " + packages[i], shell=True)
            else:
                sp.run("yay -S " + packages[i], shell=True)


if __name__ == "__main__":
    Installer.install(["vlc", "firefox", "spotify"])