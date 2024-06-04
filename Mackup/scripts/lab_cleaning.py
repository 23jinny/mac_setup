#!/usr/bin/env python3

# import pandas as pd
# import numpy as np
import random

# TODO: take command line arguments for additional members, excluded members etc.

# members_sheet_url = "https://docs.google.com/spreadsheets/d/1b1tKVLYvQ1LmyvQc8Da9S1Zu7Qe9C6ovUzxttTqd4NA/edit?usp=drive_link"
all_members = [
    "davide",
    "dinos",
    "dongju",
    "eunhyuk",
    "hasan",
    "husam",
    "inyup",
    "jaehyeon",
    "jaehyeong",
    "junwoo",
    "reem",
    "sunjoo",
    "sangjin",
    "taesuk",
    "youngjune",
    "yunseok",
]
excluded_members = {
    "davide": "overseas",
    "reem": "health issues",
    "dongju": "class",
    "jaehyeong": "class",
    "yunseok": "sick",
}
# excluded_members_msg = f"Excluded member(s): {', '.join(excluded_members)}"
excluded_members_msg = "Excluded member(s):"
for member in excluded_members:
    excluded_members_msg += f" {member} ({excluded_members[member]}),"
excluded_members_msg = excluded_members_msg.rstrip(",")

participants = list(set(all_members).difference(excluded_members.keys()))
random.shuffle(participants)

roles = {
    "Sweep floor (Area 1)": 1,
    "Sweep floor (Area 2)": 1,
    "Sweep floor (Area 3 + center)": 1,
    "Sweep floor (Area 4)": 1,
    "Mop floor (Area 1)": 1,
    "Mop floor (Area 2)": 1,
    "Mop floor (Area 3 + center)": 1,
    "Mop floor (Area 4)": 1,
    "Clean tabletops & shelves (+ center)": 2,
    # "Clean air purifier filters": 1,
    "Clean windows & window sill": 1,
}
# assigned_roles = {}
assigned_roles_msg = ""
assigned = 0
for key in roles:
    # assigned_roles[key] = []
    for i in range(roles[key]):
        # assigned_roles.append()
        assigned_roles_msg += f"- {key:<{len(max(roles.keys(), key=len)) + 1}}: {participants[assigned]}\n"
        assigned += 1

resting_members = participants[assigned:]
resting_members_msg = f"Lucky member(s): {', '.join(resting_members)}"

message = f"""
<Blueprint>
---WINDOW-----WINDOW---
|          |          |
|          |          |
|    1     |     2    |
|          |          |
|          |          |
----   --CENTER--   ---
|SHELVES              |
|       SHELVES       |
|    3  SHELVES  4    |
|TABLE  SHELVES       |
|       SHELVES       |
----DOOR---------------

<Assigned Roles>
(Total Members: {len(all_members)} / Included: {len(all_members) - len(excluded_members)} / Excluded: {len(excluded_members)})

{assigned_roles_msg}
{resting_members_msg}
{excluded_members_msg}

<Instructions>
1. Move everything you can off of the floor (shoes, trash cans, bags etc.).
    * Put them on your desk or chair.
2. Move all chairs out into the corridor.
3. Sweep the floor.
    * Make sure to get all the dust deep under the desks. 
4. Mop the floor. 
    * Be careful not to mop the power strips.
5. Everything else.
    - Clean the windows.
        * Use dedicated window cleaners for the windows (ask Sangjin).
        * Don't forget to clean the window sill!
    - Clean the air purifier filters.
        * Turn off the devices first and make sure the filters are dry before putting them back in.

It is highly recommended to do some personal cleaning too.
- Clean your desk and shelves.
- Clean your fan.
- Clean power strips (clean dust, remove unused appliances, cover unused holes).
- Move your computer from the floor onto your desk, as the dust on the floor 
will build up in your computer easily.

<Precautions>
- Late appearances/absences will be recorded for each session. There are no penalties as of now.

"""
print(message)
