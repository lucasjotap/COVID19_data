import json
import pygal
from country_code import get_country_code
from pygal.style import RotateStyle

# Load files into a list.
filename = 'covidData.json'
with open(filename) as f:
    covid_data = json.load(f)

# ----
data_dict = {}
for data in covid_data:
    country = data["location"]
    total_cases = data["total_cases"]
    code = get_country_code(country)
    if code:
        data_dict[code] = total_cases

wm_style = RotateStyle('#336699')
wm = pygal.maps.world.World(style=wm_style)
wm.title = 'World Population Covid Total Cases'
wm.add('Data from 2022', data_dict)

wm.render_to_file("world_population.svg")

