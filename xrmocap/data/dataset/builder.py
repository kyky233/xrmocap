# yapf: disable
from mmcv.utils import Registry

from .base_dataset import BaseDataset
from .mview_mperson_dataset import MviewMpersonDataset
from .mvp_dataset import MVPDataset

# yapf: enable

DATASETS = Registry('dataset')
DATASETS.register_module(
    name='MviewMpersonDataset', module=MviewMpersonDataset)
DATASETS.register_module(name='MVPDataset', module=MVPDataset)


def build_dataset(cfg) -> BaseDataset:
    """Build dataset."""
    return DATASETS.build(cfg)
