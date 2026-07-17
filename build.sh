#!/bin/bash
set -e

pip install -r requirements.txt pyinstaller

pyinstaller --noconfirm color-picker.spec

echo "Built: dist/Color Picker.app"
