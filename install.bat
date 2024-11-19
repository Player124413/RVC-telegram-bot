@echo off
@chcp 65001

::call local_path.bat

cd libs

python -m venv venv
call venv/Scripts/activate

cd audio_separator
echo Install Pythoch
python ../../utils/install_pytorch.py
echo Install files for audio_separator
pip install -r requirements.txt
pip install -U demucs

cd ..
cd rvc
echo Install requirments for rvc
pip install -r requirements.txt

echo Install requirments forsilero-tts
cd..
cd siero-tts-server
start install.bat

cd ../../
cd utils
echo Download hubert_base и rmvpe for  RVC
python dowload_rvc_base.py

echo Download Uvr Models
python dowload_uvr_models.py

pause
cd ..
cd main
npm install
