import re

key = 42

def xor_encode(s):
    utf8_bytes = s.encode('utf-8')
    return [b ^ key for b in utf8_bytes]

strings_to_hide = [
    'NweTool',
    'v1.0',
    'NweTool_ESP',
    'Fly',
    'Visual',
    'Misc',
    'MOVEMENT',
    'Fly Speed',
    'SPACE — Up  |  Q — Down',
    'RENDERING',
    'PLAYERS',
    'EXTRAS',
    'WORLD',
    'DISPLAY',
    'SERVER',
    'PLAYER',
    'FLY SETTINGS',
    'Infinite Jump (V)',
    'Click TP (Mouse)',
    'Fullbright',
    'Remove Fog',
    'Crosshair',
    'ESP (Player Names)',
    'God Mode',
    'Invisible',
    'Fling',
    'Reach (20 studs)',
    'Spin Bot',
    'Anti-AFK',
    'Auto Collect',
    'BRING ALL TOOLS',
    'BTOOLS (Local)',
    'TELEPORT TO PLAYER',
    'REJOIN',
    'SERVER HOP',
    'DESTROY GUI',
    'RESET SPEED',
    'RESET WORLD',
    'Player name to TP...',
    'https://games.roblox.com/v1/games/',
    '/servers/Public?sortOrder=Asc&limit=100',
]

# Read original
with open('original_code/NweTool.lua', 'r', encoding='utf-8') as f:
    code = f.read()

# Build string table
string_table = []
index_map = {}
for i, s in enumerate(strings_to_hide):
    encoded = xor_encode(s)
    string_table.append(encoded)
    index_map[s] = i

# Replace quoted strings
def replace_string(m):
    s = m.group(1)
    if s in index_map:
        return f'_s[{index_map[s]}]'
    return m.group(0)

result = re.sub(r'"([^"]*)"', replace_string, code)

# Build decoder
decoder_lines = []
decoder_lines.append("local _s = {}")
decoder_lines.append("local function _xor(a,b) local r,p=0,1 for i=0,7 do if(math.floor(a/p)%2)~=(math.floor(b/p)%2)then r=r+p end p=p*2 end return r end")
for i, encoded in enumerate(string_table):
    nums = ','.join(str(n) for n in encoded)
    decoder_lines.append(f"_s[{i}] = (function() local d={{ {nums} }}; local r=\"\"; for _,b in ipairs(d) do r=r..string.char(_xor(b,42)) end; return r end)()")

decoder = '\n'.join(decoder_lines)

final = decoder + '\n\n' + result

with open('NweTool_OBFUSCATED.lua', 'w', encoding='utf-8') as f:
    f.write(final)

print(f"Done! {len(final.encode('utf-8'))} bytes, {len(strings_to_hide)} strings encoded")
