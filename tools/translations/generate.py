import xml.etree.ElementTree as ET
import xml.dom.minidom
import argparse
import csv

def generate(original_file_path, lang, prefix):
    with open(original_file_path, 'r') as file:
        data = list(csv.DictReader(file, delimiter=','))

    # First rearrange data in a dict compose like thid:
    # { "<code>": { "<field>": { "orig": "<original text>", "<lang>": "<translated text>" } } }
    processed = {}
    trans_fields = ["TYPE", "COMMAND", "NAME", "CONTENT", "CATEGORY", "COLOR", "DESCRIPTION"]
    for element in data:
        code = element["CODE"]
        processed[code] = {}
        for field in trans_fields:
            if element.get(field):
                processed[code][field] = {}
                processed[code][field]["orig"] = element[field]
                processed[code][field][lang] = element.get(f"{field}_{lang}", "")

    # Generate the XML tree for the translations file
    ts = ET.Element("TS", version="2.1", language=f"{lang.lower()}_{lang}")
    context = ET.SubElement(ts, "context")
    name = ET.SubElement(context, "name")
    name.text = "CardsData"

    # This is only used to avoid processing two times the same line
    processed_lines = []

    # Output js filename
    out_js_filename = f"{prefix}.js"
    with open(out_js_filename, "w") as js_out:
        count = 1
        for code, data in processed.items():
            for field in data.values():
                # Extract original text with all '\n' characters included
                source_text = repr(field['orig'])[1:-1]
                if source_text not in processed_lines:
                    processed_lines.append(source_text)
                    # Write the line to the js output file first
                    js_out.write(f"QT_TRANSLATE_NOOP(\"CardsData\", \"{source_text}\")\n")
                    # Create the XML element for translations data
                    msg = ET.SubElement(context, "message")
                    ET.SubElement(msg, "location", filename=out_js_filename, line=f"{count}")
                    source = ET.SubElement(msg, "source")
                    source.text = source_text
                    # Set translation as unfinished, it will have to be checked manually
                    trans = ET.SubElement(msg, "translation", type="unfinished")
                    # Write the actual translation text
                    trans.text = field[lang]
                    # Keep js file's line count updated
                    count += 1
        # Write the final .ts file, to be opened in QT linguist
        tree = ET.ElementTree(ts)
        tree.write(f"{prefix}_{lang.lower()}.ts", encoding="utf-8", xml_declaration=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Convert a CSV file into a js file usable by QT')
    parser.add_argument('original_file', help='path of the CSV file to process')
    parser.add_argument('prefix', help='Name of the application to translate (icaion, mysthea, thefall)')
    parser.add_argument('lang', help='Lang code (eg IT, ES, JP) output')
    args = parser.parse_args()
    generate(args.original_file, args.lang, args.prefix)
