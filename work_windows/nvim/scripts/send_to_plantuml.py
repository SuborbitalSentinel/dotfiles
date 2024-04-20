import os
from plantuml import PlantUML


uml_file = ''
plantuml = PlantUML("http://localhost:8080/png/")
output_file = f"{uml_file}.png"
if plantuml.processes_file(uml_file, outfile=output_file):
    os.startfile(output_file)
    print("Diagram Generated!")
else:
    print("failed to generate plantuml diagram")
