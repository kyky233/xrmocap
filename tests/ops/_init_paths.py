import os.path as osp
import sys


def add_path(path):
    if path not in sys.path:
        sys.path.insert(0, path)


this_dir = osp.dirname(__file__)

lib_path = osp.join(this_dir, '../../../xrmocap')
add_path(lib_path)
print(f"=> add path: {osp.abspath(lib_path)}")
