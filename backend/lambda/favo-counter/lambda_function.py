import json
from favo_system import fav_api

favo_table = "favodb"
user_table = "userdb"

urlquery_identify = "name"
# local_endpoint_url = "http://localhost:4566"

def err(s_code):
    msg = ""
    match s_code:
        case 500:
            msg = "Internal Server Error."
        case 400:
            msg = "Bad Request."
    return {
        'statusCode': s_code,
        'body': msg
    }

def handler(event, context):
    result = {}
    method = event['requestContext']['http']['method']  
    if method != "POST" and method != "GET":
        return err(500)

    identify = event['queryStringParameters'].get(urlquery_identify)

    if identify == None:
        return err(400)

    # page_url = json.loads(identify)
    api = fav_api(
        favo_table)

    match method:
        case "GET":
            result = api.page_fav_read(identify)
        case "POST":
            result = api.page_fav_add(identify)

    return result

if __name__ == "__main__":
    event = {
        "requestContext": {
            "http": {
                "method": "GET"
            }
        },
        "queryStringParameters": {
            urlquery_identify: "/hogehoge"
        }
    }
    handler(event=event, context="")