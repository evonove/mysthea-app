import argparse
import csv

def generate(original_file_path, fields, delimiter):
    with open(original_file_path, 'r') as file:
        data = list(csv.DictReader(file, delimiter=delimiter))

    processed = []
    for element in data:
        for field in fields:
            value = element[field]
            if value and value not in processed:
                processed.append(value)

    with open("result.js", "w") as out:
        for line in processed:
            out.write(f"QT_TRANSLATE_NOOP(\"CardsData\", \"{repr(line)[1:-1]}\")\n")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Convert a CSV file into a js file usable by QT')
    parser.add_argument('-d', '--delimiter', default=',', help='Delimiter used in the CSV file, defaults to ","')
    parser.add_argument('original_file', help='path of the CSV file to process')
    parser.add_argument('fields', metavar='field', type=str, nargs='+',help='Fields to extract from the CSV')
    args = parser.parse_args()
    generate(args.original_file, args.fields, args.delimiter)
