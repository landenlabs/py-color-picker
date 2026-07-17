# -*- mode: python ; coding: utf-8 -*-

import re
from pathlib import Path

_version_src = Path('version.py').read_text()
VERSION = re.search(r'__version__\s*=\s*"([^"]+)"', _version_src).group(1)

a = Analysis(
    ['color-picker.py'],
    pathex=[],
    binaries=[],
    datas=[
        ('icon.png', '.'),
        ('screens/landenlabs_400.webp', 'screens'),
    ],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='color-picker',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=['icon.icns'],
)
coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='color-picker',
)
app = BUNDLE(
    coll,
    name='Color Picker.app',
    icon='icon.icns',
    bundle_identifier='com.landenlabs.colorpicker',
    version=VERSION,
    info_plist={
        'CFBundleShortVersionString': VERSION,
        'CFBundleVersion': VERSION,
        'CFBundleDisplayName': 'Color Picker',
        'CFBundleName': 'Color Picker',
        'CFBundleGetInfoString': f'Color Picker {VERSION}, © 2026 LanDen Labs',
        'NSHumanReadableCopyright': '© 2026 LanDen Labs',
        'NSHighResolutionCapable': True,
        'LSApplicationCategoryType': 'public.app-category.graphics-design',
    },
)
