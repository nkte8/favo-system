import boto3

class base_api:
    def __init__(self, table, endpoint_url = None) -> None:
        __table = boto3.resource('dynamodb', endpoint_url=endpoint_url)
        self.table = __table.Table(table)

    def table_read(self, key_name, key_value, request_data_key):
        try:
            exist_data = self.table.get_item(
                Key={
                    key_name: key_value
                }
            )
            return exist_data['Item'][request_data_key]
        except KeyError:
            print('I: Not found')
            return 0
        except Exception as e:
            print('E: Unexpected error')
            # print(e)
            return -500

    def table_push(self, key_name, key_value, 
                            request_data_key, request_data_value):
        result = False
        update_item = {
            key_name: key_value,
            request_data_key: request_data_value
        }
        try:
            self.table.put_item(Item=update_item)
            result = 200
        except Exception as e:
            result = -500
            print('E: Unexpected error')
            # print(e)
        return result
