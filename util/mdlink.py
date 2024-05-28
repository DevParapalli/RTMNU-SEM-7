import os
import pathlib
import glob
from urllib.parse import quote

def mdlink(pattern: str, path: str, old: str, new:str):
    for file in glob.glob(str(pathlib.Path(path).joinpath(pattern)), recursive=True):
        yield f"- [{os.path.basename(file)}]({file.replace(os.path.basename(file), quote(os.path.basename(file)))})".replace(old, new).replace("\\", "/")
        
if __name__ == "__main__":
    import sys
    print(sys.argv)
    for link in mdlink(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]):
        print(link)

# Sample Usage

# > python .\mdlink.py "*.pdf" "..\past-papers\winter23" "..\past-papers" "."

# "*.pdf" - pattern to search for
# "..\past-papers\winter23" - path to search
# "..\past-papers" - old path to replace
# "." - new path to replace with
