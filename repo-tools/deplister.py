#!/usr/bin/python

from subprocess import run, PIPE
import httpx
import re


def check_package(_id, version) -> bool:
    resp = httpx.get(f"https://api.nuget.org/v3-flatcontainer/{_id.lower()}/{version}/{_id.lower()}.nuspec")
    return resp.status_code != 404


response = str(run(["dotnet", "list", "package", "--include-transitive"], stdout=PIPE).stdout)

result = re.findall(
    "> ([A-z0-9.-]*) *([A-z0-9.-]*)",
    str(response)
)

for match in result:
    if not check_package(match[0], match[1]): continue  # filter local dependencies
    print(f"{match[0]}@{match[1]}".replace("\\n", ""))
