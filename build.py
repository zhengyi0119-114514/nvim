import sys;

file = open("./lua/cfg/keymap-jump-whichkey.lua","w")
file.write(
"""local wk = require("which-key")
wk.add({
"""+'\n')

mode = {0:"j",1:"k"}
key = ";asdfghjkl"

format_str = """    {"<leader>;%s%s",desc="%s"},"""
format_str2 = """    {"<leader>;%s%sm","%d%s",desc="%s"},"""

file.write((format_str%("","","Jump to")))
file.write('\n')
for i in range(0,2):
    file.write(format_str%(mode[i],"",'up' if i == 1 else 'down'))
    for t in range(1,1000):
        num_str = ""
        for c in [int(char) for char in str(t)]:
            num_str+=key[c]
            pass
        file.write((format_str%(mode[i],num_str,str(t) ))+"\n")
        file.write(((format_str2%(mode[i],num_str,t,mode[i],str(t))))+'\n')
        file.flush()
        pass
    file.write((format_str%(mode[i],"",'down' if i==0 else 'up'))+'\n')
    file.flush()
    pass
file.write("""})"""+'\n')
file.flush()
file.close()
