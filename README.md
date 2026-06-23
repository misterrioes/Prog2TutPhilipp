# Scala notebooks in VS Code

The notebooks in this repository use the [Almond](https://almond.sh/) Jupyter kernel with **Scala 2.13.14**.

## Windows setup

1. Install [VS Code](https://code.visualstudio.com/), [Python](https://www.python.org/downloads/), and a JDK (Java 11 or newer, for example [Temurin 17](https://adoptium.net/temurin/releases/?version=17)).

2. Install Jupyter and the VS Code Jupyter extension in PowerShell:

   ```powershell
   python -m pip install --upgrade pip jupyter
   code --install-extension ms-toolsai.jupyter
   ```

3. Install [Coursier](https://get-coursier.io/docs/cli-installation):

   ```powershell
   Invoke-WebRequest -Uri "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-win32.zip" -OutFile "cs.zip"
   Expand-Archive -Path "cs.zip" -DestinationPath "." -Force
   .\cs.exe setup
   ```

   Restart PowerShell after `cs setup` so that the updated `PATH` is available.

4. Install the Almond kernel for this repository's Scala version:

   ```powershell
   cs launch almond --scala 2.13.14 -- --install
   ```

## macOS setup

Install [VS Code](https://code.visualstudio.com/), Python 3, and a JDK (Java 11 or newer), then run:

```bash
python3 -m pip install --upgrade pip jupyter
code --install-extension ms-toolsai.jupyter

brew install coursier/formulas/coursier
cs setup
cs launch almond --scala 2.13.14 -- --install
```

## Linux setup

Install [VS Code](https://code.visualstudio.com/), Python 3, and a JDK (Java 11 or newer), then run:

```bash
python3 -m pip install --upgrade pip jupyter
code --install-extension ms-toolsai.jupyter

curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
chmod +x cs
./cs setup
./cs launch almond --scala 2.13.14 -- --install
```

## Run a notebook

1. Open this repository in VS Code: `code .`
2. Open a file from the `notebooks` directory.
3. Click **Select Kernel** in the top-right corner and choose **Scala 2.13.14** (Almond).
4. Run a cell with the play button or `Shift+Enter`.

To check whether Almond was installed correctly, run:

```text
jupyter kernelspec list
```

If Scala is not listed in VS Code, restart VS Code and select the kernel again.
