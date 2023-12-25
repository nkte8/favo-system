import json
from api import favo_api

favo_table = "favodb"
user_table = "userdb"

page_api = favo_api(favo_table, rcode_data_name="favcount")
user_api = favo_api(user_table, rcode_data_name="favcount")

def handler(event, context):
    result = {
        'statusCode': 404
    }
    if (event.get('requestContext', {}).get('http', {}).get('method') is not None):
        method = event['requestContext']['http']['method']

        if method != "POST":
            raise Exception("Invalid method")

    body = json.loads(event.get('body',None))

    arg = body.get('arg',None)
    user_id = body.get('user',None)
    page_id = body.get('id',None)

    if user_id != None:
        match arg:
            case "read":
                result = user_api.page_fav_read(user_id)
            case "push":
                result = user_api.page_fav_push(user_id)
            case "pop":
                pass
                # result = user_api.page_fav_pop(user_id)
            case default:
                raise Exception("Invalid order")

    if page_id != None:
        match arg:
            case "read":
                result = page_api.page_fav_read(page_id)
            case "push":
                result = page_api.page_fav_push(page_id)
            case "pop":
                pass
            case default:
                raise Exception("Invalid order")

    return result

if __name__ == "__main__":
    handler({
        "requestContext": {
            "http":{
                "method": "POST"
            }
        },
        "body": json.dumps({
            "arg": "read",
            "id": "hoge",
        })
    }, None)