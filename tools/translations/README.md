# Translations generator

To generate a new `<prefix>.js` file containing translations ready to be copied in the source code, run:
```
python generate.py <csv_path> <prefix> <language>
```

To generate all the needed files, run all the following commands:
```
# Mysthea
python generate.py mysthea/cards.csv mysthea DE
python generate.py mysthea/cards.csv mysthea ES
python generate.py mysthea/cards.csv mysthea FR
python generate.py mysthea/cards.csv mysthea IT
python generate.py mysthea/cards.csv mysthea JP
# Icaion
python generate.py icaion/cards.csv icaion DE
python generate.py icaion/cards.csv icaion ES
python generate.py icaion/cards.csv icaion FR
python generate.py icaion/cards.csv icaion IT
python generate.py icaion/cards.csv icaion JP
# The Fall
python generate.py thefall/cards.csv thefall DE
python generate.py thefall/cards.csv thefall ES
python generate.py thefall/cards.csv thefall FR
python generate.py thefall/cards.csv thefall IT
python generate.py thefall/cards.csv thefall JP
```

Then copy the content of `<prefix>.js` and the various `<prefix>_<lang>.ts` files inside the project.
