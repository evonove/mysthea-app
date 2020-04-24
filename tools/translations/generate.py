import argparse
import csv

def generate(original_file_path):
    with open(original_file_path, 'r') as file:
        data = list(csv.DictReader(file))

    processed = []
    for element in data:
        for field in ["TYPE", "COMMAND", "DESCRIPTION", "NAME"]:
            value = element[field]
            if value and value not in processed:
                processed.append(value)

    with open("result.js", "w") as out:
        for line in processed:
            out.write(f"QT_TRANSLATE_NOOP(\"{repr(line)[1:-1]}\")\n")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Convert a CSV file into a js file usable by QT')
    parser.add_argument('original_file', help='path of the CSV file to process')
    args = parser.parse_args()
    generate(args.original_file)
