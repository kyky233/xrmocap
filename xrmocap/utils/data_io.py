import os
import pickle


def load_pickle_file(f_path):
    if not os.path.exists(f_path):
        raise Exception(f"{f_path} does exist, please check your input...")
    else:
        with open(f_path, 'rb') as f:
            f_data = pickle.load(f)
        return f_data