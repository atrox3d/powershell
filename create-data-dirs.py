from pathlib import Path
import shutil

NAMES_FILE = 'names.txt'
NAMES_DIR = 'names'

# if not Path(NAMES_FILE).exists():
    # print(f'FATAL | {NAMES_FILE} does not exist')
    # print('exiting')
    # exit()
print(f'INFO | deleting {NAMES_DIR}...')
shutil.rmtree(NAMES_DIR, ignore_errors=True)

try:
    with open(NAMES_FILE) as fp:
        for name in [name.strip() for name in fp.readlines()]:
            name_dir = Path(NAMES_DIR) / name
            
            print(f'INFO | creating dir {name_dir}')
            Path(name_dir).mkdir(parents=True)

            config_file = name_dir / 'config.txt'
            print(f'INFO | creating dir {config_file}')
            with open(config_file, 'w') as wp:
                wp.write(f'This is a config file for {name}\n')

except FileNotFoundError:
    print(f'FATAL | {NAMES_FILE} does not exist')
    print('exiting')
    exit()
