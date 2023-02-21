import os
import subprocess
import sys
from pathlib import Path

if __name__ == "__main__":
    # File at lib/pythonX.Y/site-packages/ninja/__main__.py
    # Binary at Library/bin/ninja.exe  # [win]
    #        at bin/ninja  # [unix]
    prefix = Path(__file__).parent.parent.parent.parent.parent.parent 
    if os.name == "nt":
        ninja = prefix / "Library" / "bin" / "ninja.exe"
    else:
        ninja = prefix / "bin" / "ninja"

    try:
        subprocess.run([str(ninja.resolve()), *sys.argv[1:]], check=True)
    except subprocess.CalledProcessError as error:
        print(str(error))
        sys.exit(1)
