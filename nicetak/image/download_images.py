import urllib.request
from pyprojroot import here
import os

url = "https://source.unsplash.com/"
d_img = {"woman":"Z5g_6TLS6Ho", "beach":"2ueUnL4CkV8", "plant":"FYgnwFMZBM0"}

for title, code in d_img.items():
    path = here(f"nicetak/image/img/{title}.png")
    if not os.path.isfile(path):
        urllib.request.urlretrieve(f"{url}{code}", path)