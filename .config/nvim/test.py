import glob
import os

from pynvim import attach

nvim_dirs = glob.glob('/run/user/1000/nvim.*')

for nvim_dir in nvim_dirs:
    socket = os.path.join(nvim_dir)
    
    if os.path.exists(socket):
        nvim = attach("socket", path=socket)
        nvim.exec_lua("synchronizeThemeWithSystem()")
