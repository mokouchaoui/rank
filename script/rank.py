import requests, json,time
USER_ID= "5f098420ac985c69454de207c0ed775aa09f12c7e1e2dc7d7070dd6ec27d49da"
USER_SECRET= "14642a473c3549245fb4250b701349f5c11cbe31461a60693aacf30d7facee90"
BASE_URL = "https://api.intra.42.fr"
def return_token():
    r = requests.post(url = BASE_URL+ "/oauth/token",
            data = {"grant_type" : "client_credentials",
                        "client_id": USER_ID,
                        "client_secret": USER_SECRET})
    data = r.json()
    return (data["access_token"])
def fetch_users(token ,page):
    r = requests.get(url = BASE_URL+"/v2/cursus_users",
            params = {"access_token" : token,
                "filter[campus_id]" : 39,
                "page[size]" : 100,
                "page[number]" : page
                },
            )
    return r.json()
def coordination():
    token = return_token()
    users = fetch_users(token,1)
    time.sleep(0.5)
    users +=fetch_users(token,2)
    users = sorted(users, key= lambda k : k["created_at"], reverse=True)
    pats=users[:200]
    pats = sorted(pats, key= lambda k : k["level"], reverse=True)
    for idx,user in enumerate(pats):
        print("{}  {} {}    ".format(idx + 1,user["user"]["login"], user["level"]))
coordination()

