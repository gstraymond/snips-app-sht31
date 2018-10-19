#/usr/bin/env bash -e

VENV=venv

if [ ! -d "$VENV" ]
then

    PYTHON=`which python2`

    if [ ! -f $PYTHON ]
    then
        echo "could not find python"
    fi
    virtualenv -p $PYTHON $VENV

fi

. $VENV/bin/activate

git clone https://github.com/adafruit/Adafruit_Python_GPIO.git
cd Adafruit_Python_GPIO
python setup.py install
cd ..

git clone https://github.com/ralf1070/Adafruit_Python_SHT31.git
cd Adafruit_Python_SHT31
sudo python setup.py install
cp Adafruit_SHT31.py ..
cd ..

rm -r Adafruit_Python_SHT31
rm -r Adafruit_Python_GPIO

pip install -r requirements.txt