import json
from favo_system import fav_api

favo_table = "favodb"
user_table = "userdb"

urlquery_identify = "name"
postrequest_register = 'register'
postrequest_slug = 'add'
# local_url = "http://localhost:4566"

def err(s_code):
    msg = ""
    match s_code:
        case 500:
            msg = "Internal Server Error."
        case 400:
            msg = "Bad Request."
        case 404:
            msg = "Not Found."
    return {
        'statusCode': s_code,
        'body': json.dumps(msg)
    }

def handler(event, context):
    result = {}
    if (event.get('requestContext', {}).get('http', {}).get('method') is not None):
        method = event['requestContext']['http']['method']

        if method != "POST" and method != "GET":
            return err(500)

    api = fav_api(favo_table)
    
    match method:
        case "GET":
            identify = event['queryStringParameters'].get(urlquery_identify)
            result = api.page_fav_read(identify)
            
        case "POST":
            body = json.loads(event.get('body',None))
            register = body.get(postrequest_register,None)
            slug = body.get(postrequest_slug,None)

            if register != None:
                result = api.page_fav_register(register)
            elif slug != None:
                result = api.page_fav_add(slug)
            else:
                return err(500)
            
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