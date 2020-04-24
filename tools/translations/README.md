# Translations generator

To generate a new "result.js" file containing translations ready to be copied in the source code, run:
```
python generate.py <file_path> <field> [<field> ...]
```

```
# Mysthea
python generate.py mysthea/cards.csv Type Category Color ENG
# Icaion
python generate.py icaion/cards.csv TYPE COMMAND DESCRIPTION NAME
# The Fall
python generate.py thefall/cards.csv TYPE COMMAND DESCRIPTION NAME
```

Then copy the content of `result.js` file inside the project.
