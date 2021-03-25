# contributing

## pre-requisites

```shell
git submodule init
git submodule update
```

### ubuntu

```shell
# setup ~/bin
export 'PATH="$HOME/bin:$PATH"' >> ~/.bashrc
mkdir -p ~/bin

# install openscad to ~/bin
wget -O ~/bin/openscad "https://files.openscad.org/OpenSCAD-2021.01-x86_64.AppImage"
chmod +x ~/bin/openscad

# install magick to ~/bin
wget -O ~/bin/magick "https://download.imagemagick.org/ImageMagick/download/binaries/magick"
chmod +x ~/bin/magick

# install NopSCADlib python dependencies
sudo apt install -y python3 python3-pip
pip3 install colorama
pip3 install codespell
pip3 install markdown
```

## scripts

with `npm` installed,

### dev

with latest [OpenSCAD](https://www.openscad.org/downloads.html) as `openscad`,

to open project in OpenSCAD:

```shell
npm run dev
```

## nopscadlib

with [NopSCADlib requirements met](https://github.com/nophead/NopSCADlib/blob/master/docs/usage.md#requirements),

to build all with NopSCADlib:

```
npm run build
```
